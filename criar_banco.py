from SiteCozinha import database, app 
from SiteCozinha.models import Usuario, Cardapio, Salada, PratoPrincipal, PratoVegetariano, Guarnicao, Acompanhamento, Fruta, Doce

with app.app_context():
    database.create_all()