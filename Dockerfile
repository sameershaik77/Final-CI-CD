# Use official Python image
FROM python:3.11-slim

WORKDIR /app

# Install build deps if needed (for psycopg2)
RUN apt-get update && apt-get install -y --no-install-recommends gcc libpq-dev \
 && rm -rf /var/lib/apt/lists/*

COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ /app

ENV PORT=8080
EXPOSE 8080

# Use gunicorn for production
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:8080", "--workers", "2"]