#!/bin/bash

# 1. Clean previous results
rm -rf results/*

# 2. Run all tests in the 'tests' folder
# -d: results directory
# -L: log level
robot -d results tests/

# 3. Automatically open the report in the default browser (Mac specific)
open results/report.html