#!/bin/sh

STATUS="OK"

jinja2 vpc.yaml.j2 config.json > vpc.yaml

aws cloudformation validate-template --template-body file://vpc.yaml
[ $? -eq 0 ] || STATUS="FAILED"

cfn-lint vpc.yaml
[ $? -eq 0 ] || STATUS="FAILED"

echo $STATUS
