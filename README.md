# Django Project Skeleton

A production-ready Django project skeleton with environment-specific settings, Docker configuration, and modern tooling.

## Features

- **Environment-specific settings**: Development, staging, production, and test configurations
- **Docker support**: Docker Compose configurations for local development and production
- **uv package management**: Modern Python package manager
- **Security-first**: Production-ready security settings
- **Testing ready**: pytest configuration with Django integration
- **Code quality**: Black, isort, flake8, and mypy integration

## Quick Start

### 1. Setup Project

```bash
# Clone or copy this skeleton
# Rename 'project_name' to your actual project name throughout the codebase

# Create virtual environment with uv
uv venv
source .venv/bin/activate  # or .venv\Scripts\activate on Windows

# Install dependencies
uv sync
```

### 2. Environment Configuration

```bash
# Copy environment template
cp .env.example .env

# Edit .env with your settings
# At minimum, change SECRET_KEY for production
```

### 3. Database Setup

```bash
# Local development with Docker
docker compose -f docker/local/docker-compose.yml up --build

# Or run locally with PostgreSQL (requires PostgreSQL installed locally)
# Make sure PostgreSQL is running and create the database first
createdb project_dev_db
cd src
python manage.py migrate
python manage.py createsuperuser
python manage.py runserver
```

## Project Structure

```
django-skeleton/
├── src/                          # Django source code
│   ├── project_name/             # Main Django project
│   │   ├── settings/             # Environment-specific settings
│   │   │   ├── common.py         # Base settings
│   │   │   ├── development.py    # Local development
│   │   │   ├── staging.py        # Staging environment
│   │   │   ├── production.py     # Production environment
│   │   │   └── test.py           # Test configuration
│   │   ├── urls.py
│   │   ├── wsgi.py
│   │   └── asgi.py
│   ├── static/                   # Static files
│   ├── media/                    # Media files
│   ├── templates/                # Global templates
│   └── manage.py
├── docker/                       # Docker configurations
│   ├── local/                    # Local development
│   └── production/               # Production deployment
├── requirements/                 # pip requirements files
│   ├── base.txt                  # Base requirements
│   ├── local.txt                 # Development requirements
│   ├── production.txt            # Production requirements
│   └── staging.txt               # Staging requirements
├── pyproject.toml                # uv/Python project configuration
├── .env.example                  # Environment variables template
└── README.md
```

## Development Commands

### Local Development

```bash
# Run with Docker
docker compose -f docker/local/docker-compose.yml up --build

# Run locally
cd src
python manage.py runserver

# Create migrations
python manage.py makemigrations

# Apply migrations
python manage.py migrate

# Create superuser
python manage.py createsuperuser
```

### Code Quality

```bash
# Format code
black src/
isort src/

# Lint code
flake8 src/
mypy src/

# Run tests
pytest
```

### Production Deployment

```bash
# Build and run production containers
docker compose -f docker/production/docker-compose.yml up --build

# Collect static files
python manage.py collectstatic --settings=project_name.settings.production

# Run migrations
python manage.py migrate --settings=project_name.settings.production
```

## Configuration

### Settings

The project uses environment-specific settings modules:

- `common.py`: Base settings shared across all environments
- `development.py`: Local development with debug enabled
- `staging.py`: Staging environment configuration  
- `production.py`: Production with security settings
- `test.py`: Test configuration with in-memory database

### Environment Variables

Key environment variables (see `.env.example`):

- `SECRET_KEY`: Django secret key (required for production)
- `DEBUG`: Debug mode (default: False)
- `DB_*`: Database configuration
- `ALLOWED_HOSTS`: Allowed hosts for production

## Customization

### Rename Project

1. Rename `project_name` directory to your project name
2. Update all references to `project_name` in:
   - Settings files
   - `manage.py`
   - `wsgi.py` and `asgi.py`
   - Docker files
   - `pyproject.toml`

### Add Django Apps

1. Create your app: `python manage.py startapp your_app`
2. Add to `INSTALLED_APPS` in `settings/common.py`
3. Add URL patterns to main `urls.py`

## Security

This skeleton includes production-ready security settings:

- HTTPS enforcement
- Security headers
- CSRF protection
- XSS protection
- Secure cookies
- Content type sniffing protection

Review and adjust security settings in `settings/production.py` for your specific needs.