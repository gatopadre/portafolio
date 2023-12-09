## TODO:
- sacar las clases de python a una carpeta aparte

## prompt proyecto de desarrollo
Hola, estoy comenzando con un proyecto de desarrollo, este es mi scafolding y el contenido de los archivos que tengo hasta el momentos:
- portafolio:
    - app:
        - app.py
    - docker-compose.yml 
    - Dockerfile 
    - LICENSE 
    - README.md 
    - requirements.txt
    - .env

- el contenido de cada archivo es:
    - .env:
    ´´´
    # Configuración de la base de datos
    MYSQL_DATABASE=database
    MYSQL_USER=admin
    MYSQL_PASSWORD=Sebastian
    ´´´

    - docker-compose.yml:
    ´´´
version: '3.8'

services:
  app:
    container_name: backend_flask
    build:
      context: .
      dockerfile: Dockerfile
    volumes:
      - .:/app
    ports:
      - 8110:8110
    environment:
      - MYSQL_DATABASE=${MYSQL_DATABASE}
      - MYSQL_USER=${MYSQL_USER}
      - MYSQL_PASSWORD=${MYSQL_PASSWORD}
      - MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
      - SQLALCHEMY_DATABASE_URI=${SQLALCHEMY_DATABASE_URI}
      - SQLALCHEMY_TRACK_MODIFICATIONS=${SQLALCHEMY_TRACK_MODIFICATIONS}
    depends_on:
      - db

  db:
    container_name: database_mysql
    image: mysql:8.0
    command: --init-file /docker-entrypoint-initdb.d/init.sql
    environment:
      MYSQL_DATABASE: ${MYSQL_DATABASE}
      MYSQL_USER: ${MYSQL_USER}
      MYSQL_PASSWORD: ${MYSQL_PASSWORD}
      MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD}
    volumes:
      - ./database/:/docker-entrypoint-initdb.d/
    ports:
      - 8111:3306
    ´´´

    - Dockerfile:
    ´´´
    FROM python:3.10

    RUN python -m venv /venv
    ENV VIRTUAL_ENV=/venv
    ENV PATH="/venv/bin:${PATH}"

    COPY . /app
    WORKDIR /app

    RUN pip install -r requirements.txt

    EXPOSE 8110

    CMD ["python", "app.py"]
    ´´´
    - README.md:
    ´´´
    # portafolio
    portafolio personal
    ´´´

    - requirements.txt:
    ´´´
    flask
    mysql-connector-python
    ´´´

    - app/app.py:
    ´´´
from flask import Flask

app = Flask(__name__)
logging.basicConfig(level=logging.DEBUG)

@app.route('/')
def index():
    return '¡Hola, este es mi portafolio personal!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8110)

´´´

Podras ayudarme a que hagamos este proyecto de desarrollo juntos?

