# AWS Cloudformation templates 

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

## rds-postgres.yaml

RDS Postgres template

### Features:
* RDS Postgres database in private subnets of VPC
* Automated backups enabled with 30 days retention
* Automated snapshot when Cloudformation stack is deleted
* Initialize database from snapshot (option)
* Multi-az deployment (option)
* Read replica (option)
* DNS CNAME (option)
* RDS KMS encryption (option)
* Cloudwatch alerting (optional)
   * CPUUtilization > 90%
   * FreeStorageSpace < 500MB
   * FreeableMemory < 100MB
* Outputs as
   * Cloudformation stack exports
   * SSM parameterstore parameters

### Outputs:

|Value |Export |Parameter |
|------|-------|----------|
|RDS Security Group|{STACKNAME}-SecurityGroup| /cloudformation/{STACKNAME}/secgroup |
|RDS Parameter Group|{STACKNAME}-ParameterGroup| /cloudformation/{STACKNAME}/paramgroup |
|Master JDBC ConnString|{STACKNAME}-JDBCConnectionString| /cloudformation/{STACKNAME}/jdbc |
|Replica JDBC ConnString|{STACKNAME}-JDBCConnectionStringReplica| /cloudformation/{STACKNAME}/jdbc-replica |

## rds-aurora.yaml
## rds-aurora-restore.yaml

RDS Aurora Servless MySQL template

If restoring from database snapshot, use rds-aurora-restore.yaml -template

### Features:
* Aurora Serverless MySQL database cluster in private subnets of VPC
* Automated backups enabled with 30 days retention
* Automated snapshot when Cloudformation stack is deleted
* RDS KMS encryption with default key
* DNS CNAME (option)
* Outputs as
   * Cloudformation stack exports
   * SSM parameterstore parameters

### Outputs:

|Value |Export |Parameter |
|------|-------|----------|
|RDS Security Group|{STACKNAME}-SecurityGroup| /cloudformation/{STACKNAME}/secgroup |
|JDBC ConnString|{STACKNAME}-JDBCConnectionString| /cloudformation/{STACKNAME}/jdbc |

## boilerplate.yaml

Boilerplate to start building things into VPC

### Features:
* ```AWS::CloudFormation::Interface``` for user friendly grouping of parameters 
* Parameter types for VPC and Subnet
* Pattern to validate CIRD
* ```Rules``` to verify subnets are in given VPC
* Conditional resource

## vpcsimple.yaml

Simple VPC with 4 equal sized subnets (2 public + 2 private) automatically calculated from VPC CIDR using ```Fn::Cidr:```
