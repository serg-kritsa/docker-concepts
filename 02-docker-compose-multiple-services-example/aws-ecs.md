
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

