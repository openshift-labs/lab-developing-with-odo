Developing with Odo
===================

In this self paced workshop you will learn how to use OpenShift Do (`odo`) to build and deploy applications on the OpenShift Container Platform.

Deploying the workshop
----------------------

To deploy the workshop for use at an event, such as a booth at a conference, where users will come and go and the number of users is unknown, you will need to deploy this to an OpenShift cluster using an account with cluster admin access.

First create a project under which the deployment for the workshop is to run. The project name `workshop` is recommended if available.

```bash
oc new-project workshop
```

Now create the deployment by running:

```bash
oc new-app https://raw.githubusercontent.com/openshift-labs/workshop-jupyterhub/develop/templates/learning-portal-production.json \
    --param PROJECT_NAME=workshop \
    --param APPLICATION_NAME=odo \
    --param TERMINAL_IMAGE=quay.io/jorgemoralespou/lab-devconf:master \
    --namespace workshop
```

The value of the `PROJECT_NAME` template parameter must match the name of the project you created. You also need to supply the `--namespace` option with the same project name if the project isn't your current context.

The value of the `APPLICATION_NAME` template parameter should be a name to identify the specific workshop.

The value of the `TERMINAL_IMAGE` is the name of the image on `quay.io` built from this repository, for this workshop.

Once deployed, run:

```bash
oc get route/odo --namespace workshop
```

to determine the name of the public route to access the workshop. Each user visiting the URL will get their own instance of the application delivering the workshop content and, embedded terminals and console.

Working on the content
----------------------

To make changes to the content, there are a few methods you can
use.

The first way is to use a local docker service running on your own machine. The local container instance will be used to host the content while you work on it. You will still need a separate OpenShift cluster to test the deployments in if you want to execute any commands given in the steps.

To use this method, first pull down the `workshop-dashboard` container image. You can switch to using the `latest` image, or other tagged version as necessary. You should use the same version as is used in the `Dockerfile`.

```bash
docker pull quay.io/openshiftlabs/workshop-dashboard:1.3.3
```

Run this image with `docker run`, exposing port `10080` so you can access it from your web browser. At the same time, mount the directory for the repository into the container at the directory `/opt/app-root/src`.

```bash
docker run --rm -p 10080:10080 -v `pwd`:/opt/app-root/src \
    quay.io/openshiftlabs/workshop-dashboard:1.3.3
```

Open a browser window against `http://localhost:10080`. Use the docker host IP if not running on `localhost`.

This will allow you to check whether your content is displayed properly and navigate back and forth through the steps.

Because you are not running in an OpenShift cluster, if you want to test running of commands against a cluster, you will need to first run `oc login` against the cluster you want to use, and provide any credentials for logging into that cluster. Alternatively, use `oc login --token` with an access token for the cluster. If the content assumes that you already have a project created for you, create a new project as necessary.

Note that because you are only using the base image `workshop-dashboard` when running the container, if there are any build steps defined in the `Dockerfile`, they will not be run. You would therefore need to manually run any build steps to further setup the environment. Be aware that because you are mounting your local repository directory, those steps could add or remove files from it. Do not therefore run steps which would be destructive to the repository directory.

Unless these additional steps are simple and non destructive, you are best off only using this method to test the display of content and any navigation.

If you desire, you can with this method keep the container running and edit the content markdown files from your local machine. When you want to check it, you need only reload the browser window, or content frame, to see the changes. You do not need to restart the container. A restart of the container would only be required if modifying the `workshop/config.js` file.

Testing the content
-------------------

To build an image and test it in a local container run time, run:

```bash
docker build -t lab-developing-with-odo .
```

Then run it as:

```bash
docker run --rm -p 10080:10080 lab-developing-with-odo:latest
```

Open a browser window against `http://localhost:10080`. Use the docker host IP if not running on `localhost`.

As before you will need to login to any OpenShift cluster from the command line using `oc login`. In this case though, the build steps have been run, so no manual steps are required to set up the environment.

To build an image and test it in conjunction with the learning portal deployment before pushing and making it public, first deploy an instance of the learning portal with an empty workshop image. Presuming the same `workshop` project is used, run:

```bash
oc new-app https://raw.githubusercontent.com/openshift-labs/workshop-jupyterhub/develop/templates/learning-portal-production.json \
    --param PROJECT_NAME=workshop \
    --param APPLICATION_NAME=odo-test \
    --namespace workshop
```

Ensure that the name of the application passed to `APPLICATION_NAME` is different to what was used above.

Run:

```bash
oc get route/odo-test --namespace workshop
```
to determine the URL for accessing this instance.

Next create a binary build from the repository directory:

```bash
oc new-build --name=lab-deploying-to-odo --binary --strategy docker
```

Each time you want to build a new version of the image to test, run:

```bash
oc start-build lab-deploying-to-odo --from-dir . --follow
```

Once the image has been built, update the learning portal image stream configuration to use your latest build.

```bash
oc tag lab-deploying-to-odo:latest odo-test-app:latest
```

This must be done each time to ensure that `latest` tag of `odo-test-app` is mapped to the image hash for the latest build.

You can then click on the "Restart" button top right of the dashboard view to force any user session to be shutdown and a new started with the new version of the image to test.
