from SiteCozinha import app, database
from SiteCozinha.models import Salada, PratoPrincipal, PratoVegetariano, Guarnicao, Acompanhamento, Fruta, Doce

def popular_banco():
    # Saladas
    saladas = ['Chicória', 'Vagem com salsa', 'Alface americano', 'Soja a campanha', 'Alface crespa', 'Cenoura cozida com passas', 'Alface lisa', 'Quiabo com tomate', 'Mix de folhas', 'Ervilha']
    for nome in saladas:
        database.session.add(Salada(nome=nome))

    # Pratos Principais
    pratos_principais = ['Lasanha a bolonhesa', 'Isca de mignon suíno acebolado', 'Supremo de frango', 'Carne assada ao molho escuro', 'Cubos de sobrecoxa ao molho de mostarda e mel']
    for nome in pratos_principais:
        database.session.add(PratoPrincipal(nome=nome))

    # Pratos Vegetarianos
    pratos_vegetarianos = ['Soja a primavera', 'Bobo de grão-de-bico', 'Hamburguer de beterraba com feijão fradinho', 'Barquete de abobrinha com soja', 'Cuscuz de milho']
    for nome in pratos_vegetarianos:
        database.session.add(PratoVegetariano(nome=nome))

    # Guarnições
    guarnicoes = ['Acelga refogada', 'Couve refogada', 'Creme de espinafre', 'Creme de espinafre vegetariano', 'Farofa de banana', 'Chuchu sauté']
    for nome in guarnicoes:
        database.session.add(Guarnicao(nome=nome))

    # Acompanhamentos
    acompanhamentos = ['Arroz parboilizado', 'Arroz integral', 'Feijão']
    for nome in acompanhamentos:
        database.session.add(Acompanhamento(nome=nome))

    # Frutas
    frutas = ['Maçã', 'Mamão', 'Doce de cocada branca', 'Duo de frutas (melão e abacaxi)', 'Melancia', 'Laranja', 'Goiabada Cremosa']
    for nome in frutas:
        database.session.add(Fruta(nome=nome))

    # Doces
    doces = ['Doce de cocada branca', 'Pavê', 'Surpresa de abacaxi', 'Goiabada Cremosa']
    for nome in doces:
        database.session.add(Doce(nome=nome))

    database.session.commit()
    print("Banco de dados populado com sucesso!")

# Executar o script dentro do contexto da aplicação
if __name__ == '__main__':
    with app.app_context():
        popular_banco()