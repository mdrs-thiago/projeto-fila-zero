from flask import Flask, make_response, jsonify, render_template, redirect, url_for, request, flash
import sqlite3
from datetime import datetime, timedelta

#from bd import pedidos

app = Flask(__name__)

app.secret_key = 'uma_chave_secreta_unica_e_segura'

@app.route('/obter', methods=['GET'])
def obter_pedidos():
    # Conectando ao banco de dados
    conn = sqlite3.connect('db/pedidos.db')
    cursor = conn.cursor()
    # Consultando todos os pedidos
    cursor.execute('SELECT * FROM pedidos')
    pedidos = cursor.fetchall()
    # Fechando a conexão
    conn.close()
    # Convertendo os dados para um formato de lista de dicionários
    pedidos_json = [
        {'id': pedido[0], 'opcao': pedido[1], 'codigo': pedido[2], 'status': pedido[3]}
        for pedido in pedidos
    ]
    return pedidos_json

def atualizar_pedido(pedido_id):
    conn = sqlite3.connect('db/pedidos.db')
    cursor = conn.cursor()
    timestamp = datetime.now()
    cursor.execute('UPDATE pedidos SET status = ?, timestamp_pronto = ? WHERE id = ?', ('pronto', timestamp, pedido_id))
    conn.commit()
    conn.close()

@app.route('/marcar_pronto/', methods = ['GET'])
def marcar_pronto():
    pedido_id = request.args.get('id',type=int)
    atualizar_pedido(pedido_id)
    return redirect(url_for('index'))

@app.route('/deletar_prontos', methods=['POST'])
def deletar_pedidos_prontos():
    # Conectar ao banco de dados SQLite
    conn = sqlite3.connect('db/pedidos.db')
    cursor = conn.cursor()
    # Excluir os pedidos com status 'pronto'
    cursor.execute("DELETE FROM pedidos WHERE status = 'pronto'")
    # Confirmar a transação
    conn.commit()
    # Fechar a conexão com o banco de dados
    conn.close()
    # Redirecionar para a página principal
    return redirect(url_for('index'))

@app.route('/aviso')
def aviso():
    return render_template('aviso.html')

@app.route('/enviar_mensagem', methods=['POST'])
def enviar_mensagem():
    mensagem = request.form.get('mensagem')
    # Lógica para processar a mensagem (por exemplo, salvar no banco de dados)

    # Envia a mensagem de feedback
    flash('Sua mensagem foi enviada com sucesso!')
    return render_template('aviso.html')

@app.route('/cardapio')
def cardapio():
    return render_template('cardapio.html')

@app.route('/')
def index():
    pedidos = obter_pedidos()
    return render_template('index.html', pedidos=pedidos)

@app.route('/cadastrar_cardapio')
def cadastrar_cardapio():
    pass

app.run(debug=True)