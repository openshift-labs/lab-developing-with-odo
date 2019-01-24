---
Title: Linking application components
PrevPage: 03-deploying-component-from-source-code
NextPage: 05-exposing-components-to-public
---

With both components of our application running on the cluster, we need to connect them so they can communicate. OpenShift provides mechanisms to publish communication bindings from a program to its clients. This is referred to as linking.

To link the current ``frontend`` component to the ``backend``, you can run:

```execute-1
odo link backend --component frontend --port 8080
```

This will inject configuration into the frontend about the backend and restart the frontend.
