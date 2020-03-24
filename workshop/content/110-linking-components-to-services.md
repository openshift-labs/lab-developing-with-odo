Now that our database is deployed, we need to connect to it from our backend so they can communicate. OpenShift provides mechanisms to publish communication bindings from a program to its clients. This is referred to as linking.

To link the current `mongodb-ephemeral` component to the backend, you can run:

```execute-1
odo link mongodb-ephemeral
```

The backend component doesn't need to be explicitly named. This command is run from the backend project directory and the context is taken from the `.odo` directory. If that context is not available, or if you simply want to be more specific in your commands, you could have run:

```bash
odo link mongodb-ephemeral --component backend
```

The link causes the MongoDB credentials secret to be exposed to the backend component. The code for the sample application is written with this knowledge and will look for the exposed environment variables when attempting to connect to the database.
1
Since this represents a configuration change for the backend, the pod is restarted. We can see when our application has been restarted by looking at the logs of the backend.

```execute-1
odo log backend -f
```

__NOTE__: The log tail may close when the application is restarted. If that happens before you see the message below, simply restart the log using the command above.

__NOTE__: As a redeployment is happening in OpenShift, this might take some time. Check the logs until the component has successfully restarted. The message you need to see before continuing is:

```
2020-03-23 15:09:12.475  INFO 31 --- [           main] c.r.o.c.ConcessionsApplication           : Started ConcessionsApplication in 4.932 seconds (JVM running for 5.828)
```

Close the running log tracking by pressing:

```execute-1
<ctrl+c>
```

When the component restarts, we can visit the same debug endpoint as before to show that the application is connected to the database:

```execute-1
curl http://backend-concessions-%project_namespace%.%cluster_subdomain%/debug
```

The output should reflect that the connection has been made and the databas is set to "sampledb", which is the default we used when deploying the MongoDB service:

```
{"connected":true,"mongo_database":"sampledb"}
```

In the next steps, we'll deploy and connect the frontend to our backend component.