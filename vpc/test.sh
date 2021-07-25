#!/bin/sh

jinja2 vpc.yaml.j2 config.json > vpc.yaml
OUTPUT=$(aws cloudformation validate-template --template-body file://vpc.yaml)
[ $? -eq 0 ] && echo "OK"

