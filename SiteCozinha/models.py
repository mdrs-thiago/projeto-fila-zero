from SiteCozinha import database, Login_manager
from flask_login import UserMixin
from datetime import datetime

# Configuração do Login Manager
@Login_manager.user_loader
def load_usuario(id_usuario):
    return Usuario.query.get(int(id_usuario))

# Modelo de Usuário
class Usuario(database.Model, UserMixin):
    id = database.Column(database.Integer, primary_key=True)
    username = database.Column(database.String, nullable=False)
    email = database.Column(database.String, nullable=False, unique=True)
    senha = database.Column(database.String, nullable=False)

# Modelo de Salada
class Salada(database.Model):
    id = database.Column(database.Integer, primary_key=True)
    nome = database.Column(database.String, nullable=False)

# Modelo de Prato Principal
class PratoPrincipal(database.Model):
    id = database.Column(database.Integer, primary_key=True)
    nome = database.Column(database.String, nullable=False)

# Modelo de Prato Vegetariano
class PratoVegetariano(database.Model):
    id = database.Column(database.Integer, primary_key=True)
    nome = database.Column(database.String, nullable=False)

# Modelo de Guarnição
class Guarnicao(database.Model):
    id = database.Column(database.Integer, primary_key=True)
    nome = database.Column(database.String, nullable=False)

# Modelo de Acompanhamento
class Acompanhamento(database.Model):
    id = database.Column(database.Integer, primary_key=True)
    nome = database.Column(database.String, nullable=False)

# Modelo de Fruta
class Fruta(database.Model):
    id = database.Column(database.Integer, primary_key=True)
    nome = database.Column(database.String, nullable=False)

# Modelo de Doce
class Doce(database.Model):
    id = database.Column(database.Integer, primary_key=True)
    nome = database.Column(database.String, nullable=False)

# Modelo de Cardápio
class Cardapio(database.Model):
    id = database.Column(database.Integer, primary_key=True)
    data = database.Column(database.Date, nullable=False)
    salada1 = database.Column(database.String, nullable=False)
    salada2 = database.Column(database.String, nullable=False)
    prato_principal = database.Column(database.String, nullable=False)
    vegetariano = database.Column(database.String, nullable=False)
    guarnicao1 = database.Column(database.String, nullable=False)
    guarnicao2 = database.Column(database.String, nullable=False)
    acompanhamento1 = database.Column(database.String, nullable=False)
    acompanhamento2 = database.Column(database.String, nullable=False)
    acompanhamento3 = database.Column(database.String, nullable=False)
    fruta = database.Column(database.String, nullable=False)
    doce = database.Column(database.String, nullable=False)

# Modelo de Cardápio da Semana
class CardapioSemana(database.Model):

    id = database.Column(database.Integer, primary_key=True)
    data = database.Column(database.Date, nullable=False)
    salada1_id = database.Column(database.Integer, database.ForeignKey('salada.id'))
    salada2_id = database.Column(database.Integer, database.ForeignKey('salada.id'))
    prato_principal_id = database.Column(database.Integer, database.ForeignKey('prato_principal.id'))
    vegetariano_id = database.Column(database.Integer, database.ForeignKey('prato_vegetariano.id'))
    guarnicao1_id = database.Column(database.Integer, database.ForeignKey('guarnicao.id'))
    guarnicao2_id = database.Column(database.Integer, database.ForeignKey('guarnicao.id'))
    acompanhamento1_id = database.Column(database.Integer, database.ForeignKey('acompanhamento.id'))
    acompanhamento2_id = database.Column(database.Integer, database.ForeignKey('acompanhamento.id'))
    acompanhamento3_id = database.Column(database.Integer, database.ForeignKey('acompanhamento.id'))
    fruta_id = database.Column(database.Integer, database.ForeignKey('fruta.id'))
    doce_id = database.Column(database.Integer, database.ForeignKey('doce.id'))

    # Relacionamentos
    salada1 = database.relationship('Salada', foreign_keys=[salada1_id])
    salada2 = database.relationship('Salada', foreign_keys=[salada2_id])
    prato_principal = database.relationship('PratoPrincipal')
    vegetariano = database.relationship('PratoVegetariano')
    guarnicao1 = database.relationship('Guarnicao', foreign_keys=[guarnicao1_id])
    guarnicao2 = database.relationship('Guarnicao', foreign_keys=[guarnicao2_id])
    acompanhamento1 = database.relationship('Acompanhamento', foreign_keys=[acompanhamento1_id])
    acompanhamento2 = database.relationship('Acompanhamento', foreign_keys=[acompanhamento2_id])
    acompanhamento3 = database.relationship('Acompanhamento', foreign_keys=[acompanhamento3_id])
    fruta = database.relationship('Fruta')
    doce = database.relationship('Doce')