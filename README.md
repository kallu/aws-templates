# AWS Cloudformation templates 

## vpc

VPC networking template

## vpc-fw

Shared egress and network firewall template

## vpc-old

Obsolete / simple VPC network templates

## rds

RDS templates

## misc

Misc demos

## boilerplate.yaml

Boilerplate to start building things into VPC

### Features:
* ```AWS::CloudFormation::Interface``` for user friendly grouping of parameters 
* Parameter types for VPC and Subnet
* Pattern to validate CIRD
* ```Rules``` to verify subnets are in given VPC
* Conditional resource

