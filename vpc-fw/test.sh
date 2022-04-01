#!/bin/sh

STATUS="OK"
TEMPLATE=vpc-egress.yaml

jinja2 ${TEMPLATE}.j2 config.json > ${TEMPLATE}

# aws cloudformation validate-template --template-body file://${TEMPLATE}
# [ $? -eq 0 ] || STATUS="FAILED"

cfn-lint ${TEMPLATE}
[ $? -eq 0 ] || STATUS="FAILED"

echo $STATUS
