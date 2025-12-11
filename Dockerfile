FROM python:3.11-slim

WORKDIR /app
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# OS deps (if psycopg2 or build tools required)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
 && rm -rf /var/lib/apt/lists/*

COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ /app/

EXPOSE 8080

# Use Gunicorn to run
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app", "--workers", "2"]