[https://eu-west-1.console.aws.amazon.com/elasticbeanstalk/home?region=eu-west-1#/gettingStarted]
'Application information' 
    'Application name'='my_app_name' > 
'Platform' 
    'Platform'='Docker' >
    Platform branch='Docker running on 64bit Amazon Linux' >
    Warning
    Deprecated platform branches aren't recommended for use in production environments. Info
    'Platform version'='2.16.0 (Recommended)' >
'Application code'
    r'Sample application' >
    Get started right away with sample code.
+'Create application' >
'Elastic Beanstalk > Environments > Reactapp-env' ...

[https://s3.console.aws.amazon.com/s3/home?region=eu-central-1]


IAM > +(Users)[https://console.aws.amazon.com/iamv2/home#/users] > +'New user'
    'Set user details' You can add multiple users at once with the same access type and permissions. Learn more
        'User name*'='username_for_react_app_depl' > 
    'Select AWS access type' Select how these users will access AWS. Access keys and autogenerated passwords are provided in the last step. Learn more
        'Access type*'=v'Programmatic access' >
    +'Next: Permission' >
        'Set permissions'=+'Attach existing policies directly'
        v'AdministratorAccess-AWSElasticBeanstalk  AWS managed  None'   
    +'Next: Tags' >
    +'Next: Review' >
    +'Create user' >

Travis > git_repo > +'More options' > +'Settings'
    |Settings| > 
    'Environmental Variables'
    'Name'='AWS_ACCESS_KEY' > 'Value'='###' > not_checked'Dispay value in build log' > +'Add'
    'Name'='AWS_SECRET_KEY' > 'Value'='###' > not_checked'Dispay value in build log' > +'Add'

## Workflow w/o travis
* zip all project files 
* navigate to Application_name-env dashboard
* +'Upload and deploy'
* upload zip file w/ project

## Deleting EBS application
1. Go to the Elastic Beanstalk dashboard.
2. In the left sidebar click "Applications"
3. Click the application you'd like to delete.
4. Click the "Actions" button and click "Delete Application"