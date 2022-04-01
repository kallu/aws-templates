#!/bin/sh

STATUS="OK"
TEMPLATES=vpc-egress.yaml

for TEMPLATE in $TEMPLATES
do
    jinja2 ${TEMPLATE}.j2 config.json > ${TEMPLATE}

    # aws cloudformation validate-template --template-body file://${TEMPLATE}
    # [ $? -eq 0 ] || STATUS="FAILED"

    cfn-lint ${TEMPLATE}
    [ $? -eq 0 ] || STATUS="FAILED"
done

echo $STATUS
