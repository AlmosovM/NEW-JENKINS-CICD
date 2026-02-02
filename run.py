from .app import create_app


# Call the Application Factory function to construct a Flask application instance
# using the standard configuration defined in /instance/flask.cfg
## Run as python run.py

from main import create_app

app = create_app()

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)


