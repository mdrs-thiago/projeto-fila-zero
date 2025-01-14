from flask import render_template, url_for, redirect, request, flash, jsonify
from SiteCozinha import app, database, bcrypt
from flask_login import login_required, login_user, logout_user, current_user
from SiteCozinha.forms import FormLogin, FormCriarConta
from SiteCozinha.models import Usuario, Cardapio, Salada, PratoPrincipal, PratoVegetariano, Guarnicao, Acompanhamento, Fruta, Doce, CardapioSemana, Aviso
import pandas as pd
import plotly.express as px
import plotly.io as pio
from datetime import datetime, timedelta
from werkzeug.utils import secure_filename
import sqlite3

# Rota principal (homepage)
@app.route("/", methods=["GET", "POST"])
def homepage():
    form_login = FormLogin()
    if form_login.validate_on_submit():
        usuario = Usuario.query.filter_by(email=form_login.email.data).first()
        if usuario:
            if bcrypt.check_password_hash(usuario.senha, form_login.senha.data):
                login_user(usuario)
                return redirect(url_for("dashboard"))
            else:
                flash("Senha incorreta. Tente novamente.", "error")  # Mensagem de erro para senha incorreta
        else:
            flash("E-mail não encontrado. Verifique o e-mail ou crie uma conta.", "error")  # Mensagem de erro para e-mail não encontrado
    return render_template("homepage.html", form=form_login)

# Rota para criar conta
@app.route("/criarconta", methods=["GET", "POST"])
def criarconta():
    form_criarconta = FormCriarConta()
    if form_criarconta.validate_on_submit():
        senha = bcrypt.generate_password_hash(form_criarconta.senha.data)
        usuario = Usuario(username=form_criarconta.username.data, senha=senha, email=form_criarconta.email.data)

        database.session.add(usuario)
        database.session.commit()

        login_user(usuario, remember=True)
        return redirect(url_for("homepage"))

    return render_template("criarconta.html", form=form_criarconta)

# Rota de logout
@app.route("/logout")
@login_required
def logout():
    logout_user()
    return redirect(url_for("homepage"))

# Carregar os dados do CSV para o dashboard
df = pd.read_csv('pedidos_marmitas.csv')

# Rota do dashboard
@app.route('/dashboard', methods=['GET', 'POST'])
@login_required
def dashboard():
    data_inicial = request.form.get('data_inicial')
    data_final = request.form.get('data_final')
    refeicao = request.form.get('refeicao')
    
    if data_inicial and data_final:
        data_inicial = datetime.strptime(data_inicial, '%Y-%m-%d')
        data_final = datetime.strptime(data_final, '%Y-%m-%d')

    df_filtrado = filtrar_dados(data_inicial, data_final, refeicao)
    
    # Gráfico 1: Quantidade de marmitas por horário
    pedidos_por_horario = df_filtrado.groupby(df_filtrado['horario'].apply(lambda x: x.hour)).size().reset_index(name='quantidade')
    pedidos_por_horario.columns = ['horario', 'quantidade']
    fig1 = px.bar(pedidos_por_horario, x='horario', y='quantidade', title='Quantidade de Marmitas por Horário')
    grafico_horario = pio.to_html(fig1, full_html=False)

    # Gráfico 2: Quantidade de marmitas por tipo
    pedidos_por_tipo = df_filtrado['tipo_pedido'].value_counts().reset_index()
    pedidos_por_tipo.columns = ['tipo_pedido', 'quantidade']
    fig2 = px.bar(pedidos_por_tipo, x='tipo_pedido', y='quantidade', title='Quantidade de Marmitas por Tipo')
    grafico_tipo = pio.to_html(fig2, full_html=False)

    # Gráfico 3: Quantidade de opções (doce e fruta)
    opcoes = ['opcao_doce', 'opcao_fruta']
    dados_opcoes = {opcao: df_filtrado[opcao].value_counts().get('Sim', 0) for opcao in opcoes}
    df_opcoes = pd.DataFrame(list(dados_opcoes.items()), columns=['opcao', 'quantidade'])
    fig3 = px.pie(df_opcoes, names='opcao', values='quantidade', title='Distribuição de Doce e Fruta')
    grafico_opcoes = pio.to_html(fig3, full_html=False)

    # Gráfico 4: Quantidade de Alunos atendido por dia
    alunos_por_dia = df_filtrado.groupby('dia_da_semana')['id_aluno'].nunique().reset_index()
    fig4 = px.bar(alunos_por_dia, x='dia_da_semana', y='id_aluno', 
             title='Quantidade de Alunos Atendidos por Dia da Semana', 
             labels={'id_aluno': 'Número de Alunos Atendidos', 'dia_da_semana': 'Dia da Semana'})
    grafico_qtd_aluno = pio.to_html(fig4, full_html=False)


    return render_template('dashboard.html', grafico_horario=grafico_horario,
                           grafico_tipo=grafico_tipo, grafico_opcoes=grafico_opcoes, grafico_qtd_aluno=grafico_qtd_aluno)

# Função para filtrar dados do CSV
def filtrar_dados(data_inicial, data_final, refeicao):
    df_filtrado = df.copy()
    df_filtrado['data'] = pd.to_datetime(df_filtrado['data'])
    df_filtrado['horario'] = pd.to_datetime(df_filtrado['horario'], format='%H:%M:%S').dt.time
    
    if data_inicial and data_final:
        df_filtrado = df_filtrado[(df_filtrado['data'] >= data_inicial) & (df_filtrado['data'] <= data_final)]
    
    if refeicao == 'almoço':
        df_filtrado = df_filtrado[df_filtrado['horario'] <= datetime.strptime('14:30:00', '%H:%M:%S').time()]
    elif refeicao == 'janta':
        df_filtrado = df_filtrado[df_filtrado['horario'] > datetime.strptime('14:30:00', '%H:%M:%S').time()]

    return df_filtrado

# Rota para a fila de pedidos
@app.route('/fila_pedidos')
@login_required
def index():
    pedidos = obter_pedidos()
    return render_template('index.html', pedidos=pedidos)

# Função para obter pedidos do banco SQLite
def obter_pedidos():
    conn = sqlite3.connect('instance/pedidos.db')
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM pedidos')
    pedidos = cursor.fetchall()
    conn.close()

    pedidos_json = [
        {'id': pedido[0], 'opcao': pedido[1], 'codigo': pedido[2], 'status': pedido[3]}
        for pedido in pedidos
    ]
    return pedidos_json

# Rota para marcar um pedido como pronto
@app.route('/marcar_pronto/', methods=['GET'])
@login_required
def marcar_pronto():
    pedido_id = request.args.get('id', type=int)
    atualizar_pedido(pedido_id)
    return redirect(url_for('index'))

# Função para atualizar o status de um pedido
def atualizar_pedido(pedido_id):
    conn = sqlite3.connect('instance/pedidos.db')
    cursor = conn.cursor()
    timestamp = datetime.now()
    cursor.execute('UPDATE pedidos SET status = ?, timestamp_pronto = ? WHERE id = ?', ('pronto', timestamp, pedido_id))
    conn.commit()
    conn.close()

# Rota para deletar pedidos com status 'pronto'
@app.route('/deletar_prontos', methods=['POST'])
@login_required
def deletar_pedidos_prontos():
    conn = sqlite3.connect('instance/pedidos.db')
    cursor = conn.cursor()
    cursor.execute("DELETE FROM pedidos WHERE status = 'pronto'")
    conn.commit()
    conn.close()
    return redirect(url_for('index'))

# Rota para a página de aviso
@app.route('/aviso')
@login_required
def aviso():
    avisos = Aviso.query.order_by(Aviso.data_criacao.desc()).all()  # Busca todos os avisos
    return render_template('aviso.html', avisos=avisos)

# Rota para enviar mensagem
@app.route('/enviar_mensagem', methods=['POST'])
@login_required
def enviar_mensagem():
    mensagem = request.form.get('mensagem')
    if mensagem:
        novo_aviso = Aviso(mensagem=mensagem) 
        database.session.add(novo_aviso)
        database.session.commit()
        flash('Sua mensagem foi enviada com sucesso!', 'success')
    else:
        flash('A mensagem não pode estar vazia.', 'error')
    return redirect(url_for('aviso'))

# Rota para exibir o cardápio
@app.route('/cardapio')
@login_required
def cardapio():
    return render_template('cardapio.html')

# Rota para cadastrar o cardápio
from datetime import datetime, timedelta

@app.route('/cadastrar_cardapio', methods=['GET', 'POST'])
@login_required
def cadastrar_cardapio():
    if request.method == 'GET':
        # Buscar todas as opções do banco de dados
        saladas = Salada.query.all()
        pratos_principais = PratoPrincipal.query.all()
        pratos_vegetarianos = PratoVegetariano.query.all()
        guarnicoes = Guarnicao.query.all()
        acompanhamentos = Acompanhamento.query.all()
        frutas = Fruta.query.all()
        doces = Doce.query.all()

        dias_semana = ['Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta']

        return render_template('cadastrar_cardapio.html', 
                              saladas=saladas, 
                              pratos_principais=pratos_principais, 
                              pratos_vegetarianos=pratos_vegetarianos, 
                              guarnicoes=guarnicoes, 
                              acompanhamentos=acompanhamentos, 
                              frutas=frutas,
                              doces=doces, 
                              dias_semana=dias_semana)
    
    elif request.method == 'POST':
        try:
            # Obter as datas de início e fim da semana
            data_inicio = datetime.strptime(request.form.get('data_inicio'), '%Y-%m-%d')
            data_fim = datetime.strptime(request.form.get('data_fim'), '%Y-%m-%d')

            dias_semana = ['Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta']
            for i, dia in enumerate(dias_semana):
                # Calcular a data do dia atual da semana
                data_dia = data_inicio + timedelta(days=i)

                # Obter os dados do formulário para cada dia
                salada1_id = request.form.get(f'salada1_{dia}')
                salada2_id = request.form.get(f'salada2_{dia}')
                prato_principal_id = request.form.get(f'prato_principal_{dia}')
                vegetariano_id = request.form.get(f'vegetariano_{dia}')
                guarnicao1_id = request.form.get(f'guarnicao1_{dia}')
                guarnicao2_id = request.form.get(f'guarnicao2_{dia}')
                acompanhamento1_id = request.form.get(f'acompanhamento1_{dia}')
                acompanhamento2_id = request.form.get(f'acompanhamento2_{dia}')
                acompanhamento3_id = request.form.get(f'acompanhamento3_{dia}')
                fruta_id = request.form.get(f'fruta_{dia}')
                doce_id = request.form.get(f'doce_{dia}')

                # Criar um novo cardápio para o dia
                novo_cardapio = CardapioSemana(
                    data=data_dia,  # Data do dia atual da semana
                    salada1_id=salada1_id,
                    salada2_id=salada2_id,
                    prato_principal_id=prato_principal_id,
                    vegetariano_id=vegetariano_id,
                    guarnicao1_id=guarnicao1_id,
                    guarnicao2_id=guarnicao2_id,
                    acompanhamento1_id=acompanhamento1_id,
                    acompanhamento2_id=acompanhamento2_id,
                    acompanhamento3_id=acompanhamento3_id,
                    fruta_id=fruta_id,
                    doce_id=doce_id
                )
                database.session.add(novo_cardapio)
            
            # Salvar no banco de dados
            database.session.commit()
            flash('Cardápio da semana cadastrado com sucesso!', 'success')
            return redirect(url_for('exibir_cardapio'))

        except Exception as e:
            # Em caso de erro, exibir mensagem e redirecionar
            database.session.rollback()
            flash(f'Erro ao cadastrar cardápio: {str(e)}', 'error')
            return redirect(url_for('cadastrar_cardapio'))

from datetime import datetime

@app.route('/exibir_cardapio', methods=['GET'])
@login_required
def exibir_cardapio():
    data_inicio = request.args.get('data_inicio')
    data_fim = request.args.get('data_fim')
    
    if data_inicio and data_fim:
        try:
            # Converter as datas para o formato correto
            data_inicio = datetime.strptime(data_inicio, '%Y-%m-%d').date()  # Garantir que seja apenas a data
            data_fim = datetime.strptime(data_fim, '%Y-%m-%d').date()  # Garantir que seja apenas a data
            
            # Filtrar os cardápios no intervalo de datas (inclusive)
            cardapios = CardapioSemana.query.filter(
                CardapioSemana.data >= data_inicio,
                CardapioSemana.data <= data_fim
            ).order_by(CardapioSemana.data).all()
        except ValueError as e:
            # Em caso de erro na conversão das datas
            flash('Formato de data inválido. Use o formato YYYY-MM-DD.', 'error')
            cardapios = CardapioSemana.query.order_by(CardapioSemana.data).all()
    else:
        # Se não houver filtro, exibir todos os cardápios
        cardapios = CardapioSemana.query.order_by(CardapioSemana.data).all()

    return render_template('exibir_cardapio.html', cardapios=cardapios)

@app.route('/incluir_alimento', methods=['GET', 'POST'])
@login_required
def incluir_alimento():
    if request.method == 'GET':
        return render_template('incluir_alimento.html')
    
    elif request.method == 'POST':
        try:
            tipo_alimento = request.form.get('tipo_alimento')
            nome_alimento = request.form.get('nome_alimento')

            if tipo_alimento == 'salada':
                novo_alimento = Salada(nome=nome_alimento)
            elif tipo_alimento == 'prato_principal':
                novo_alimento = PratoPrincipal(nome=nome_alimento)
            elif tipo_alimento == 'vegetariano':
                novo_alimento = PratoVegetariano(nome=nome_alimento)
            elif tipo_alimento == 'guarnicao':
                novo_alimento = Guarnicao(nome=nome_alimento)
            elif tipo_alimento == 'acompanhamento':
                novo_alimento = Acompanhamento(nome=nome_alimento)
            elif tipo_alimento == 'fruta':
                novo_alimento = Fruta(nome=nome_alimento)
            elif tipo_alimento == 'doce':
                novo_alimento = Doce(nome=nome_alimento)
            else:
                flash('Tipo de alimento inválido!', 'error')
                return redirect(url_for('incluir_alimento'))

            database.session.add(novo_alimento)
            database.session.commit()
            flash('Alimento adicionado com sucesso!', 'success')
            return redirect(url_for('incluir_alimento'))

        except Exception as e:
            database.session.rollback()
            flash(f'Erro ao adicionar alimento: {str(e)}', 'error')
            return redirect(url_for('incluir_alimento'))

