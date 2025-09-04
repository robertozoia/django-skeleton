FROM python:3.13.3-slim

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y 
RUN apt-get -y install gcc postgresql-client ghostscript
RUN apt-get -y install postgresql-contrib build-essential libpq-dev
RUN apt-get -y install python3-opencv

# Always handy...
RUN apt-get -y install neovim

# cron
RUN apt-get install -y cron

# clean apt
RUN rm -fr /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY requirements/base.txt /app/base.txt
COPY requirements/production.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy project
COPY src/ /app/
COPY .env.production /app/.env


# Collect static files
RUN python manage.py collectstatic --noinput --settings=project_name.settings.production

# Configure cron jobs
COPY docker/production/cronjobs /etc/cron.d/cronjobs
RUN chmod +x /app/cronjobs/run_cron.sh
RUN chmod 0644 /etc/cron.d/cronjobs
RUN crontab /etc/cron.d/cronjobs
RUN touch /var/log/cron.log

# Run gunicorn
CMD ["sh", "-c", "cron && cd /app && DJANGO_SETTINGS_MODULE=project_name.settings.production gunicorn --bind 0.0.0.0:8000 idecon.wsgi:application"]

