---
Title: Linking application components
PrevPage: 070-deploying-component-from-source-code
NextPage: 090-exposing-components-to-public
---

With both components of our application running on the cluster, we need to connect them so they can communicate. OpenShift provides mechanisms to publish communication bindings from a program to its clients. This is referred to as linking.

To link the current ``frontend`` component to the ``backend``, you can run:

```execute-1
odo link backend --component frontend --port 8080
```

This will inject configuration into the frontend about the backend and restart the frontend.

Some components might expose multiple ports, and you need to select which one is the appropriate to use. In case you don't specify the port to use, you will see a nice warning message instructing you how to best proceed.
