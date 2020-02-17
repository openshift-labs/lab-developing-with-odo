# Lab - Developing with odo

* [Overview](#overview)
* [Deploying the Workshop](#deploying-the-workshop)
  * [Deploying to OpenShift](#deploying-to-openshift)
  * [Deploying on Red Hat Product Demo System](#deploying-on-red-hat-product-demo-system)
* [Running the Workshop](#running-the-workshop)
* [Deleting the Workshop](#deleting-the-workshop)
* [Development](#development)

## Overview

The Developing with odo Workshop provides a deep introduction to the OpenShift Do (`odo`) command line tool. `odo` provides a simplified command line client for deploying applications to OpenShift. Participants will learn how to create and deploy applications, how to use interactive mode, how to link components and services, and how to do iterative development.

| | |
--- | ---
| Audience Experience Level | Beginner |
| Supported Number of Users | Up to 100 per cluster |
| Average Time to Complete | 60 minutes |


### Agenda
* Workshop Overview
* What is `odo`
* Deploying a Sample Application
* Using Interactive Mode
* Interacting with OpenShift
* Creating an Application
* Creating a New Binary Component
* Component Configuration
* Exposing Components to the Public
* Deploying Components from Source Code
* Deploying a Service
* Linking Components to Services
* Setting an Active Component
* Linking Application Components
* Making Changes to Source
* What's Next
* Installing `odo`
* `odo` CLI Preferences
* Further Resources

## Deploying the Workshop

### Deploying to OpenShift

To deploy the workshop, first clone a copy of the master branch of this Git repository to your own machine using the command:

```bash
git clone --single-branch --branch master --recurse-submodules //github.com/openshift-labs/lab-developing-with-odo.git
```

Change the working directory to lab-developing-with-odo.

If you forgot to use the --recurse-submodules option when cloning the repository, run:

```bash
git submodule update --init --recursive
```

Next create a project in OpenShift into which the workshop is to be deployed.

```
oc new-project labs
```

From within the top level of the Git repository, now run:

```
./.workshop/scripts/deploy-spawner.sh
```

The name of the deployment will be ``developing-with-odo``.

### Deploying on Red Hat Product Demo System

The workshop is found in the catalog under the Workshops folder and is named OCP4 Workshop Developing with ODO.

Once the cluster is deployed, follow the directions in the next section to begin the workshop itself.

You can determine the hostname for the URL to access the workshop by running:

```
oc -n labs get route odo-spawner
```

## Running the Workshop

When first accessing the workshop URL, the user may be presented with a warning about a potential security risk. This is due to the workshop using a self-signed certificate and users should be instructed to elect to continue to the site.

That URL leads to a login for the workshop itself.

![Workshop Login](/docs/jupyter-login.png)

Users will enter the following information:

| Key | Value |
| --- | ----- |
| Username | The user's e-mail address. This address is not saved anywhere outside of the workshop itself; it will not be used to follow up with the user. It simply acts as a unique identifier for the workshop instance. Logging into the site with a new username will cause a new instance of the workshop to be created (on the same cluster, however, so previously run cluster-wide operations will still be in effect. |
| Password | ``openshift`` |

After logging in, the workshop takes a few seconds to start:

![Workshop Startup](/docs/starting-up.png)

Once the workshop begins, users are presented with a two panel interface:

![Workshop Terminal](/docs/workshop-terminal.png)

On the left are the instructions users will follow for the workshop. The workshop itself explains how to use the interface, but generally speaking users will follow the directions on the left, with navigation buttons appearing at the end of each section. Text that is highlighted with a yellow background may be clicked to have the operation automatically executed in the cluster on the right.

By default, users are presented with the terminal, which contains (among other things) an authenticated ``oc`` client. The ``Console`` tab on the right can be clicked to open the OpenShift web console. Again, the user will already be authenticated; if a workshop requires users to change their logged in OpenShift user, the workshop instructions will specifically mention that.

![Workshop Console](/docs/workshop-console.png)
An example of the lab guides is available [here](http://devops-guides-labs.b9ad.pro-us-east-1.openshiftapps.com/).

## Deleting the Workshop

To delete the spawner and any active sessions, including projects, run:

```
./.workshop/scripts/delete-spawner.sh
```

To delete the build configuration for the workshop image, run:

```
./.workshop/scripts/delete-workshop.sh
```

To delete special resources for CRDs and cluster roles for the Kafa operator, run:

```
./.workshop/scripts/delete-resources.sh
```

Only delete these last set of resources if the Kafa operator is not being used elsewhere in the cluster. Ideally this workshop environment should only be deployed in an expendable cluster, and not one which is shared for other work.

## Development

The deployment created above will use a version of the workshop which has been pre-built into an image and which is hosted on ``quay.io``.

To make changes to the workshop content and test them, edit the files in the Git repository and then run:

```
./.workshop/scripts/build-workshop.sh
```

This will replace the existing image used by the active deployment.

If you are running an existing instance of the workshop, from your web browser select "Restart Workshop" from the menu top right of the workshop environment dashboard.

When you are happy with your changes, push them back to the remote Git repository. This will automatically trigger a new build of the image hosted on ``quay.io``.

If you need to change the RBAC definitions, or what resources are created when a project is created, change the definitions in the ``templates`` directory. You can then re-run:

```
./.workshop/scripts/deploy-spawner.sh
```

and it will update the active definitions.

Note that if you do this, you will need to re-run:

```
./.workshop/scripts/build-workshop.sh
```

to have any local content changes be used once again as it will revert back to using the image on ``quay.io``.

__NOTE__: If you want to update the version of the workshop scripts used with your workshop, run again the git submodule update --remote command. Then update the version of the dashboard base image in the Dockerfile to match.

```
git submodule update --remote
(. .workshop/scripts/default-settings.sh; sed -i -e "s%^FROM .*$%FROM $DASHBOARD_IMAGE%" Dockerfile)
```

