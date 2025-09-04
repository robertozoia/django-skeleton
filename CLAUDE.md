# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Django project skeleton designed for creating new Django applications with production-ready configurations.

## Development Commands

### Local Docker Development Setup
```bash
docker compose -f docker/local/docker-compose.yml up --build
```

### Database Operations
```bash
# Create migrations
python manage.py makemigrations --settings=project_name.settings.development

# Apply migrations  
python manage.py migrate --settings=project_name.settings.development

# Create superuser
python manage.py createsuperuser --settings=project_name.settings.development
```

### Package Management with uv
```bash
# Install dependencies
uv sync

# Add new dependency
uv add package-name

# Add development dependency
uv add --dev package-name

# Update dependencies
uv lock --upgrade
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

## Architecture

### Technology Stack
- **Backend**: Django 5.1.6+ with PostgreSQL for all environments
- **Package Management**: uv for fast Python package management
- **Deployment**: Docker + Nginx + Gunicorn
- **Code Quality**: Black, isort, flake8, mypy

### Settings Structure
Environment-specific settings in `src/project_name/settings/`:
- `common.py`: Base settings
- `development.py`: Local development (PostgreSQL, debug toolbar)
- `staging.py`: Staging environment
- `production.py`: Production environment (security headers, logging)
- `test.py`: Test environment (in-memory DB, fast hashers)

## Important Paths
- **Main app**: `src/`
- **Static files**: `src/static/`
- **Media files**: `src/media/`
- **Templates**: `src/templates/`
- **Requirements**: `requirements/` directory with environment-specific files

## Customization Notes
When creating a new project from this skeleton:

1. **Rename project_name**: Replace all instances of 'project_name' with actual project name
2. **Update settings**: Modify database settings, allowed hosts, etc.
3. **Environment variables**: Copy `.env.example` to `.env` and configure
4. **Security**: Generate new SECRET_KEY for production

## Docker Configuration
- **Local**: `docker/local/` - Development with hot reload
- **Production**: `docker/production/` - Production-ready with Nginx

## Security Features
- Environment-based configuration separation
- Production security headers
- HTTPS enforcement in production
- Secure session/CSRF cookies
- Content security policies