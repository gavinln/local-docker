FROM python:3.14.8-slim-trixie

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt --root-user-action=ignore

COPY . .

EXPOSE 5000

CMD ["python", "main.py"]
