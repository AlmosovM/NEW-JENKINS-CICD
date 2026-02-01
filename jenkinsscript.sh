#!/bin/bash
set -e

echo "### Python info ###"
python3 --version
which python3

echo "### Run unit tests using stdlib unittest ###"

# Ensure report directory exists
mkdir -p xmlReport

# Run unittest discovery and output results
python3 - << 'EOF'
import unittest
import sys
import xml.etree.ElementTree as ET
from datetime import datetime

loader = unittest.TestLoader()
suite = loader.discover("utests")

runner = unittest.TextTestRunner(verbosity=2)
result = runner.run(suite)

# Generate minimal JUnit XML
testsui
