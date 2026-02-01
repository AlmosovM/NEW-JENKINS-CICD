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
from datetime import datetime

loader = unittest.TestLoader()
suite = loader.discover("utests")

runner = unittest.TextTestRunner(verbosity=2)
result = runner.run(suite)

testsuite = ET.Element(
    "testsuite",
    name="unittest",
    tests=str(result.testsRun),
    errors=str(len(result.errors)),
    failures=str(len(result.failures)),
    timestamp=datetime.utcnow().isoformat()
)

tree = ET.ElementTree(testsuite)
tree.write("xmlReport/output.xml", encoding="utf-8", xml_declaration=True)

sys.exit(0 if result.wasSuccessful() else 1)
EOF

echo "### Done ###"
