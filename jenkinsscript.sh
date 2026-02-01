#!/bin/bash
set -e

echo "### Python info ###"
python3 --version
which python3

# Ensure pipx is available
export PATH="$HOME/.local/bin:$PATH"

echo "### Install pipx (user space) ###"
python3 -m pip install --user pipx --break-system-packages || true
pipx ensurepath || true

echo "### Install test tools via pipx ###"
pipx install pytest || true
pipx install pytest-cov || true

echo "### Run tests + coverage ###"
pipx run pytest utests \
  --cov=main \
  --cov-report=xml \
  --junitxml=xmlReport/output.xml

echo "### Done ###"
