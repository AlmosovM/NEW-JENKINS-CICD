from main import create_app

# Call the Application Factory function to construct a Flask application instance
# using the standard configuration defined in /instance/flask.cfg
## Run as python run.py

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent))

from main import create_app
