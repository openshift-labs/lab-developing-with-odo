Now that our database is deployed, we need to connect to it from our `backend` so they can communicate. OpenShift provides mechanisms to publish communication bindings from a program to its clients. This is referred to as linking.

To link the current ``mongodb`` component to the ``backend``, you can run:

```execute-1
odo link mongodb-ephemeral
```

This will inject configuration into the backend about the mongodb and restart the backend.

We can see when our application has been restarted by looking at the logs of the backend.

```execute-1
odo log backend -f
```

__NOTE__: As a redeployment is happening in OpenShift, this might take some time. Check the logs until the component has successfully restarted. The message you need to see before continuing is:

```
Listening on 0.0.0.0, port 8080
```

Then enter:

```execute-1
<ctrl+c>
```

__NOTE__: Due to a bug this is currently taking a bit longer than expected, so be patient.

When the component restarts, you should now see a log showing the connection details to our database. We can now execute the same command we did before to load the database with data.

First we verify there's no data in the database:

```execute-2
curl http://backend-parksmap-%project_namespace%.%cluster_subdomain%/ws/data/all
```

If there is nothing in the database, you can expect the following result:

```
[]
```

We now load the data for our database:

```execute-2
curl http://backend-parksmap-%project_namespace%.%cluster_subdomain%/ws/data/load
```

And now we verify that the data is there:

```execute-2
curl http://backend-parksmap-%project_namespace%.%cluster_subdomain%/ws/data/all
```
