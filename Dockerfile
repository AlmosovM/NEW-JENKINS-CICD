#Dockerfile
#docker build -t mysmartapp .
#docker run -d -p 5000:5000 mysmartapp

FROM python:3.12-slim

WORKDIR /smartapp

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV PYTHONPATH=/smartapp

CMD ["python", "run.py"]
