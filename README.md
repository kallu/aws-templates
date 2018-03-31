# AWS Cloudformation templates 

### vpc.yaml

AWS VPC network template

### Features:
* VPC
* Internet gataway
* Public and private subnet for each AZ
* Shared routing table for public subnets and dedicated tables for each private subnet
* NAT gateway for each AZ when there is both public and private subnet
* Option to use pre-allocated EIPs for NAT gateways
* Routing from private subnets to internet via NAT gateway in same AZ
* VPN gateway and routing for private subnets
* VPC S3 end-point and routing for every subnet
* Internal R53 zone
* Outputs as
   * Cloudformation stack exports
   * SSM parameterstore parameters

### Outputs:

|Value |Export |Parameter |
|------|-------|----------|
|VPC ID|{STACKNAME}-VpcId|/cloudformation/{STACKNAME}/vpcid|
|Public Subnets|{STACKNAME}-PubSubnets|/cloudformation/{STACKNAME}/pubsubnets|
|Private Subnets|{STACKNAME}-PrivSubnets|/cloudformation/{STACKNAME}/privsubnets|
|Internal R53 ZoneID|{STACKNAME}-R53ZoneId|/cloudformation/{STACKNAME}/r53zoneid|

![VPC diagram](/vpc.png)
