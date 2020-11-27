This repositary contains the framework of 
1. Storing all configuration elements in git (this folder)
2. When changing files a pipeline will run doing the following
a. Use a gitlab-runner to pull the folder, copy the license from CICD variables, build image, push to registry
b. Use gitlab-runner to use SSH to log into docker host, pull new image from registry and start container

Documentation for NAP
https://docs.nginx.com/nginx-app-protect/configuration/


