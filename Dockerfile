FROM python:3.10

RUN python -m venv /venv
ENV VIRTUAL_ENV=/venv
ENV PATH="/venv/bin:${PATH}"

COPY . /app
WORKDIR /app

RUN pip install -r requirements.txt

EXPOSE 8110

CMD ["python", "app.py"]