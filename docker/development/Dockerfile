FROM python:3.13.3-slim

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    postgresql-client \
    postgresql-contrib \
    build-essential \
    libpq-dev \
    neovim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY requirements/base.txt /app/base.txt
COPY requirements/development.txt /app/requirements.txt 

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy project
COPY src/ /app/
COPY .env.development /app/.env

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000", "--settings=project_name.settings.development"]
