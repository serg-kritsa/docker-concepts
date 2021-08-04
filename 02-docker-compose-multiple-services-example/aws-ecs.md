
## multi-container hosting
https://eu-central-1.console.aws.amazon.com/ecs/home?region=eu-central-1#/taskDefinitions
https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definitions.html
https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html

if "essential": true then others will be stopped

## usual exposing port as 80:80 
"portMappings": [
    {
        "hostPort": 80,
        "containerPort": 80
    }
],
## required links to specified containers
"links": ["client", "server"], uni-directional way

check json format

## EBS Application Creation
[https://eu-central-1.console.aws.amazon.com/elasticbeanstalk/home?region=eu-central-1#/gettingStarted]
+'Create Application'

'Application information' 
    'Application name'='my_app_name' > 
'Platform' 
    'Platform'='Docker' >
    Platform branch='Multi-Container Docker running on 64bit Amazon Linux' >
    Warning
    Deprecated platform branches aren't recommended for use in production environments. Info
    'Platform version'='2.26.4 (Recommended)' >
'Application code'
    r'Sample application' >
    Get started right away with sample code.
+'Create application' >
'Elastic Beanstalk > Environments > Reactapp-env' ...

## VIRTUAL PRIVATE CLOUD
[https://eu-central-1.console.aws.amazon.com/vpc/home?region=eu-central-1#vpcs:]
[https://eu-central-1.console.aws.amazon.com/vpc/home?region=eu-central-1#securityGroups:]


## RDS Database Creation (Managed Relational Database Service)
+'Create database'
+'PostgreSQL' >
'Templates' Choose a sample template to meet your use case 
    +'Dev/Test' >
'Settings' 
'DB Instance identifier'='multi-docker-postgres' >
    'Credentials Settings'
    'Master Username'='postgres' > 
    'Master Password'='postgrespassword' >
    'Confirm password'='postgrespassword' >
'DB instance class'
    'DB instance class' Choose a DB instance class that meets your processing power and memory requirements. The DB instance class options below are limited to those supported by the engine you selected above.
    r'Burstable classes (includes t classes)'
    v'db.t3.micro'
'Connectivity'
    'Virtual private cloud (VPC)' VPC that defines the virtual networking environment for this DB instance.
    v'Default VPC (vpc-########)'
'Additional Configuration'
    'Initial database name'='fibvalues'
+'Create Database'

## ElastiCache Redis Creation
ElastiCache. In-Memory Cache
+'Redis' in sidebar >
+'Create'
'Create your Amazon ElastiCache cluster'
'Cluster engine'=r'Redis'
    'Cluster Mode Enabled' is NOT ticked
'Redis Settings'
    'Name'='multi-docker-redis'
Change 'Node type'=v'cache.t2.micro'
'Number of replicas'='0'
'Advanced Redis settings' Advanced settings have common defaults set to give you the fastest way to get started. You can modify these now or after your cluster has been created.
    'Name'='redis-group'
    'VPC ID'=default
    'Subnets'= tick 3 in table
+'Create'

## Creating a Custom Security Group
VPC
'Security section' in the left sidebar > +'Security Groups'
+'Create Security Group' >
    'Create security group' A security group acts as a virtual firewall for your instance to control inbound and outbound traffic. To create a new security group, complete the fields below.
    'Basic details'
        'Security group name'='multi-docker' >
        'Description'='multi-docker' >
        'VPC'=default VPC >
        +'Create Security Group' >
Enter in created security group
    +'Actions' > 'Edit inbound rules' >
    +'Add rule' >
        'Port Range'='5432-6379' >
        'Source'='Custom'
        start typing 'sg' into the box. Select the Security Group you just created >
        +'Save rules'
        
## Applying Security Groups to ElastiCache
ElastiCache
+'Redis' in Sidebar
    +'Actions' > +'Modify'
        Click the pencil icon to edit the 'VPC Security group'
            Tick the box next to the new multi-docker group 
            +'Save'
        +'Modify'

## Applying Security Groups to RDS
Go to AWS Management Console and use Find Services to search for RDS

+'Databases' in Sidebar > 
    r'multi-docker-postgres' >
    +'Modify'
        'Connectivity'
        'Security group'=add the new multi-docker security group > 
        +'Continue' > 
    +'Modify DB instance'

## Applying Security Groups to Elastic Beanstalk
Elastic Beanstalk > 
+'Environments' in the left sidebar > +''MultiDocker-env' > +'Configuration'
    +'Edit' In the Instances row
        'EC2 Security Groups' > tick box next to multi-docker
        +'Apply' >
    +'Confirm'
    +'Edit' In the Software row
        'Environment properties' The following properties are passed in the application as environment properties. 
        REDIS_HOST=redis-instance-primary-endpoint-ip-addr
        REDIS_PORT=6379
        PGUSER=rdb-instance-user
        PGPASSWORD=rdb-instance-user
        PGHOST=rdb-instance-endpoint-ip-addr
        PGDATABASE=fibvalues
        
## Cleaning up resources
Elastic Beanstalk > 
+'Application' in the left sidebar >
    +'multi-docker' row > +'Actions' > +'Delete Application'
RDS > 
+'Databases' in the left sidebar >
    +'multi-docker-postgres' row > +'Actions' > +'Delete'
    not-ticked'Create final snapshot?'
    ticked'I acknowledge that upon instance deletion, automated backups, including system snapshots and point-in-time recovery, will no longer be available.'
ElastiCache > 
+'Redis' in the left sidebar >
    +'multi-docker-redis' row > +'Actions' > +'Delete'
VPS > 
+'Security Groups' in the left sidebar >
    + row > +'Actions' > +'Delete'
