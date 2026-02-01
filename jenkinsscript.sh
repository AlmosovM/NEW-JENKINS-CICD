#!/bin/bash
set -e

echo "### Python info ###"
python3 --version
which python3

echo "### Create virtual environment ###"
python3 -m venv venv
source venv/bin/activate

echo "### Upgrade pip ###"
pip install --upgrade pip

echo "### Install dependencies ###"
pip install -r requirements.txt
pip install pytest pytest-cov

echo "### Run tests + coverage ###"
pytest utests \
  --cov=main \
  --cov-report=xml \
  --junitxml=xmlReport/output.xml

echo "### Done ###"
deactivate
