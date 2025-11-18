FROM python:3.11-slim

WORKDIR /app

# Copiar dependencias
COPY src/api/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copiar aplicación
COPY src/api/ .

# Copiar modelos entrenados
COPY models/trained/ models/trained/

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]