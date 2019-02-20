---
Title: Linking application components
PrevPage: 081-change-active-component
NextPage: 100-making-changes-to-source-code
---

With both components of our application running on the cluster, we need to connect them so they can communicate. OpenShift provides mechanisms to publish communication bindings from a program to its clients. This is referred to as linking.

To link the current ``frontend`` component to the ``backend``, you can run:

```execute-1
odo link backend --component frontend --port 8080
```

__NOTE__: Here we have explicitly provided the component to which the link should happen although it's not needed. It's only there for teaching purposes.

This will inject configuration into the frontend about the backend and restart the frontend.

Some components might expose multiple ports, and you need to select which one is the appropriate to use. In case you don't specify the port to use, you will see a nice warning message instructing you how to best proceed.

Your frontend component will be redeployed.

__NOTE__: We have found a bug in `odo` as we were testing this lab and you'll need to re-push your application again. This will be fixed in the coming week. Trust us :-D

```execute-1
odo push frontend
```

You can check the the startup logs:

```execute-1
odo log -f
```

Once the component has succesfully been re-deployed you can see the changes in the map URL:

http://frontend-parksmap-%project_namespace%.%cluster_subdomain%

You should now see a nice map showing where you can find Nationalparks.