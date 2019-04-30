#!/bin/bash

fail()
{
    echo $* 1>&2
    exit 1
}

WORKSHOP_IMAGE="quay.io/openshiftlabs/lab-developing-with-odo:latest"

TEMPLATE_REPO=https://raw.githubusercontent.com/openshift-labs/workshop-spawner
TEMPLATE_VERSION=3.0.5
TEMPLATE_FILE=learning-portal-production.json
TEMPLATE_PATH=$TEMPLATE_REPO/$TEMPLATE_VERSION/templates/$TEMPLATE_FILE

JUPYTERHUB_APPLICATION=${JUPYTERHUB_APPLICATION:-developing-with-odo}

JUPYTERHUB_NAMESPACE=`oc project --short 2>/dev/null`

if [ "$?" != "0" ]; then
    fail "Error: Cannot determine name of project."
    exit 1
fi

echo
echo "### Creating spawner application."
echo

oc process -f $TEMPLATE_PATH \
    --param APPLICATION_NAME="$JUPYTERHUB_APPLICATION" \
    --param PROJECT_NAME="$JUPYTERHUB_NAMESPACE" | oc apply -f -

if [ "$?" != "0" ]; then
    fail "Error: Failed to create deployment for spawner."
    exit 1
fi

echo
echo "### Waiting for the spawner to deploy."
echo

oc rollout status dc/"$JUPYTERHUB_APPLICATION"

if [ "$?" != "0" ]; then
    fail "Error: Deployment of spawner failed to complete."
    exit 1
fi

echo
echo "### Updating spawner to use image for workshop."
echo

oc tag "$WORKSHOP_IMAGE" "${JUPYTERHUB_APPLICATION}-app:latest"

if [ "$?" != "0" ]; then
    fail "Error: Failed to update spawner to use workshop image."
    exit 1
fi

echo
echo "### Route details for the spawner are as follows."
echo

oc get route "${JUPYTERHUB_APPLICATION}"
