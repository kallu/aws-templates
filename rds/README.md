# AWS RDS Cloudformation templates 

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

