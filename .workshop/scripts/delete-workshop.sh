#!/bin/bash

set -x
set -eo pipefail

WORKSHOP_NAME=lab-developing-with-odo
JUPYTERHUB_APPLICATION=${JUPYTERHUB_APPLICATION:-developing-with-odo}
JUPYTERHUB_NAMESPACE=`oc project --short`

oc delete all --selector build="$WORKSHOP_NAME"
