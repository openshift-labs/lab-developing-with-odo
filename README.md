Developing with Odo
===================

In this self paced workshop you will learn how to use OpenShift Do (`odo`) to build and deploy applications on the OpenShift Container Platform.

Deploying the Workshop
----------------------

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
oc new-project workshops
```

From within the top level of the Git repository, now run:

```
./.workshop/scripts/deploy-spawner.sh
```

The name of the deployment will be ``developing-with-odo``.

You can determine the hostname for the URL to access the workshop by running:

```
oc get route developing-with-odo
```

Editing the Workshop
--------------------

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

Deleting the Workshop
---------------------

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