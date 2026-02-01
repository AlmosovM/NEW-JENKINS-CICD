#!/bin/bash
set -e

echo "### Python info ###"
python3 --version
which python3

echo "### Run unit tests using stdlib unittest ###"

mkdir -p xmlReport

python3 <<'EOF'
import unittest
import sys
import xml.etree.ElementTree as ET
from datetime import datetime, UTC

loader = unittest.TestLoader()
suite = loader.discover("utests", pattern="test*.py")

runner = unittest.TextTestRunner(verbosity=2)
result = runner.run(suite)

tests_run = result.testsRun
errors = len(result.errors)
failures = len(result.failures)

testsuite = ET.Element(
    "testsuite",
    {
        "name": "
