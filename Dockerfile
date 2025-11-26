FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY main.py .

# O Cloud Run injeta a porta na variável PORT, padrão 8080
CMD exec uvicorn main:app --host 0.0.0.0 --port ${PORT:-8080}
