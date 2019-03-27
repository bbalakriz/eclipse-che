Build custom docker image
===========================

1. Create a Dockerfile in the relevant folder with the image details 
2. Trigger the build.
~~~
docker build --tag <<image_name>>:latest . 
# For instance, bbalasub/custom-java-stack
~~~
3. After the build is successful, view the list of images to verify that the created images is listed
~~~
docker images
~~~
4. Log into the image registry --> Quay here
~~~
docker login quay.io
# or docker login docker.io
~~~
5. Create a container and run the image
~~~
docker run -it <<image_name>> (interactive terminal)
OR 
docker run -d <<image_name>> (to run in background)
~~~
6. View the running containers and pick the currently created container
~~~
docker ps -l
~~~
7. Commit the created container so that it can be pushed to the registry
~~~
Create the repo in Quat first and get its name
docker commit <<cont_id>> quay.io/balki404/<<repo_name>>
# or docker commit 94e0a0eafe91 docker.io/bbalasub/custom-java-stack
~~~
8. Push the commited container to the registry
~~~
docker push quay.io/balki404/<<repo_name>>

~~~


Enabling sudo access to all pods that run under eclipse-che project
====================================================================

oc adm policy add-scc-to-user anyuid system:serviceaccount:eclipse-che:che-workspace where <<che-workspace>> is the name of the service account to which the anyuid access needs to be granted and <<eclipse-che>> is the name of the project/namepsace

Enabling https for the keycloak app under the eclipse-che project
==================================================================

oc create route edge keycloak-https --service=keycloak -n eclipse-che


