#!/bin/sh
#
# vpc.yaml.j2 is Jinja2 template that will generate Cloudformation YAML template with input
# from config.json in this same directory. To render vpc.yaml you need to
#
#    Install Jinja CLI
#
#    % pip install jinja-cli
#
#    Render Cloudformation template
#
#    % jinja2 vpc.yaml.j2 config.json > vpc.yaml
#
# Or you can just say ./build.sh to generate the template and verify with cfn-lint

STATUS="OK"
TEMPLATES="vpc.yaml"

for TEMPLATE in $TEMPLATES
do
    jinja2 ${TEMPLATE}.j2 config.json > ${TEMPLATE}

    # aws cloudformation validate-template --template-body file://${TEMPLATE}
    # [ $? -eq 0 ] || STATUS="FAILED"

    cfn-lint ${TEMPLATE}
    [ $? -eq 0 ] || STATUS="FAILED"
done

echo $STATUS
