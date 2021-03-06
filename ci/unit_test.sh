#!/bin/bash
# set -e -x

# This file is the entrypoint for tests for local, docker and ci so be sure if you modify it that it works in all!

# If running locally we don't need to step into the pystacks directory
if [ $# -eq 0 ]
  then
    pushd pystacks 2> /dev/null || true
fi

if [ -f ./requirements_test.txt ]; then
   pip install -q -r ./requirements_test.txt
else
   pip install -q -r ../requirements_test.txt
fi

echo "+--------------------+"
echo "| Running Unit Tests |"
echo "+--------------------+"

pytest --pyargs PyStacks -s

