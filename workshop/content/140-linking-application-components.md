With both components of our application running on the cluster, we need to connect them so they can communicate. OpenShift provides mechanisms to publish communication bindings from a program to its clients. This is referred to as linking.

To link the current ``frontend`` component to the ``backend``, you can run:

```execute-1
odo link backend --component frontend --port 8080
```

__NOTE__: Here we have explicitly provided the component to which the link should happen although it's not needed. It's only there for teaching purposes.

This will inject configuration into the frontend about the backend and restart the frontend.

Now, re-push the component:

```execute-1
odo push
```

You can check the the startup logs:

```execute-1
odo log -f
```

Similar to before, you can expect to see something similar to the following when the frontend has been successfully redeployed:

```
2019-05-03 19:17:24.055  INFO 912 --- [           main] c.o.evg.roadshow.ParksMapApplication     : Started Park
sMapApplication in 10.51 seconds (JVM running for 11.128)
```

Run the following to stop tailing the logs:

```execute-1
<ctrl+c>
```

Once the component has successfully been re-deployed you can see the changes in the map URL:

http://frontend-parksmap-%project_namespace%.%cluster_subdomain%

You should now see a nice map showing where you can find national parks.

![parksmap with data](parksmap-data.png)
