FROM python:3.14.8-slim-trixie

WORKDIR /app

RUN useradd -m flask-server

USER flask-server

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "main.py"]
