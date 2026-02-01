#!/bin/bash
set -e

echo "### Python info ###"
python3 --version
which python3

echo "### Install dependencies (user space) ###"
python3 -m pip install --user --upgrade pip
python3 -m pip install --user -r requirements.txt
python3 -m pip install --user pytest pytest-cov

# Ensure user-installed binaries are on PATH
export PATH="$HOME/.local/bin:$PATH"

echo "### Run tests + coverage ###"
pytest utests \
  --cov=main \
  --cov-report=xml \
  --junitxml=xmlReport/output.xml

echo "### Done ###"
