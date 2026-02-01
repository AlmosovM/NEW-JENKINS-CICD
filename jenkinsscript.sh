#!/bin/bash
set -e

echo "### Python info ###"
python3 --version
which python3

echo "### Run unit tests using stdlib unittest ###"

mkdir -p xmlReport

cat > run_unittests.py <<'PYCODE'
import unittest
import sys
import xml.etree.ElementTree as ET
from datetime import datetime, timezone

loader = unittest.TestLoader()
suite = loader.discover("utests", pattern="test*.py")

runner = unittest.TextTestRunner(verbosity=2)
result = runner.run(suite)

tests_run = result.testsRun
errors = len(result.errors)
failures = len(result.failures)

testsuite = ET.Element("testsuite")
testsuite.set("name", "unittest")
testsuite.set("tests", str(max(1, tests_run)))
testsuite.set("errors", str(errors))
testsuite.set("failures", str(failures))
testsuite.set("timestamp", datetime.now(timezone.utc).isoformat())

if tests_run == 0:
    tc = ET.SubElement(testsuite, "testcase")
    tc.set("classname", "unittest")
    tc.set("name", "no_tests_discovered")
    ET.SubElement(tc, "skipped").text = "No tests were discovered"

ET.ElementTree(testsuite).write(
    "xmlReport/output.xml",
    encoding="utf-8",
    xml_declaration=True
)

sys.exit(0 if result.wasSuccessful() else 1)
PYCODE

python3 run_unittests.py
echo "### Done ###"
