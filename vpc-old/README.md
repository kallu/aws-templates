
# AWS VPC network templates

## vpc.yaml / vpc1nat.yaml

AWS VPC network template

### Features:
* VPC
* Internet gataway
* Public and private subnet for each AZ
* Shared routing table for public subnets and dedicated tables for each private subnet
* NAT gateway for each AZ when there is both public and private subnet
* Option to use pre-allocated EIPs for NAT gateways
* Routing from private subnets to internet via NAT gateway in same AZ.
NOTE: vpc1nat.yaml will use a single NAT gateway in AZ-A public subnet for all private subnets.
* VPC S3 end-point and routing for every subnet
* Option for VPC interface end-points for private subnets
   * com.amazonaws.region.ssm
   * com.amazonaws.region.ec2
   * com.amazonaws.region.ssmmessages
   * com.amazonaws.region.ec2messages
   * com.amazonaws.region.ecs
   * com.amazonaws.region.ecs-agent
   * com.amazonaws.region.ecs-telemetry
   * com.amazonaws.region.ecr.api
   * com.amazonaws.region.ecr.dkr
   * com.amazonaws.region.cloudformation
* Option for internal R53 zone
* Outputs as
   * Cloudformation stack exports
   * SSM parameterstore parameters

![VPC diagram](/vpc.png)

### Outputs:

|Value |Export |Parameter |
|------|-------|----------|
|VPC ID|{STACKNAME}-VpcId|/cloudformation/{STACKNAME}/vpcid|
|Public Subnets|{STACKNAME}-PubSubnets|/cloudformation/{STACKNAME}/pubsubnets|
|Private Subnets|{STACKNAME}-PrivSubnets|/cloudformation/{STACKNAME}/privsubnets|
|Internal R53 ZoneID|{STACKNAME}-R53ZoneId|/cloudformation/{STACKNAME}/r53zoneid|

## vpcsimple.yaml

Simple VPC with 4 equal sized subnets (2 public + 2 private) automatically calculated from VPC CIDR using ```Fn::Cidr:```
