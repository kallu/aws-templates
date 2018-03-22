# AWS Cloudformation templates 

### vpc.yaml

AWS VPC network template

### Features:
* VPC
* Internet gataway
* Public and private subnet for each AZ
* Shared routing table for public subnets and dedicated tables for each private subnet
* NAT gateway for each AZ when there is both public and private subnet
* Option
	- to use existing EIPs for NAT gateways OR
	- to retain EIPs allocated for NAT gateways after stack deletion
* Routing from private subnets to internet via NAT gateway in same AZ
* VPN gateway and routing for private subnets
* VPC S3 end-point and routing for every subnet
* Internal R53 zone

![VPC diagram](/vpc.png)
