"""
Settings package for project_name.
"""

import os

# Default to development settings if not specified
DJANGO_SETTINGS_MODULE = os.environ.get('DJANGO_SETTINGS_MODULE', 'project_name.settings.development')

if 'development' in DJANGO_SETTINGS_MODULE:
    from .development import *
elif 'production' in DJANGO_SETTINGS_MODULE:
    from .production import *
elif 'test' in DJANGO_SETTINGS_MODULE:
    from .test import *
else:
    from .development import *  # fallback to development

