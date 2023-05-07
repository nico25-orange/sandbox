#!/bin/bash

readonly TOKEN='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'
readonly USERNAME='masa25hw'
readonly REPONAME='sandbox'
WORKFLOW_FILENAME='hello.yml'
# readonly BRANCHNAME="main'

curl \
  -X POST \
  -H "Authorization: token $TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/$USERNAME/$REPONAME/actions/workflows/$WORKFLOW_FILENAME/dispatches \
  -d '{"ref":"main"}'

echo "Run \"$WORKFLOW_FILENAME\"!"

WORKFLOW_FILENAME='hello-with-input.yml'

curl \
  -X POST \
  -H "Authorization: token $TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/$USERNAME/$REPONAME/actions/workflows/$WORKFLOW_FILENAME/dispatches \
  -d '{"ref":"main", "inputs": { "my_hello_input": "input from curl" } }' \

echo "Run \"$WORKFLOW_FILENAME\"!"
