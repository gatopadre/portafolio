import logging
from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy
import os

app = Flask(__name__, template_folder='templates', static_folder='static')
logging.basicConfig(level=logging.DEBUG)

# Configuración de SQLAlchemy desde el archivo .env
app.config['SQLALCHEMY_DATABASE_URI'] = os.environ.get('SQLALCHEMY_DATABASE_URI')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = os.environ.get('SQLALCHEMY_TRACK_MODIFICATIONS')

# Inicialización de SQLAlchemy
db = SQLAlchemy(app)


# Definir modelos con SQLAlchemy
class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)

    def __repr__(self):
        return '<User %r>' % self.username


@app.route('/')
def index():
    return render_template('index.html')

@app.route('/test')
def test():
    # Ejemplo de uso de SQLAlchemy
    users = User.query.all()
    return str(users)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8110, debug=True)
