from SiteCozinha import database, app 
from SiteCozinha.models import Usuario

with app.app_context():
    database.create_all()