With the ``frontend`` component running, we are ready to bring up the backend component. Once again, source code for the component is already available in the environment you are using. Change directories to the ``backend`` directory.

```execute-1
cd ~/backend
```

Listing the contents of this directory shows that ``backend`` is a simple Node.js application.

```execute-1
ls
```

Since ``backend`` is written in an interpreted language, there is no build step analogous to the maven build we performed for the ``frontend`` component. We can proceed directly to selecting the ``nodejs`` environment from the cluster's service catalog.

We give this Node.js component the name ``backend``.

```execute-1
odo create nodejs backend --app parksmap
```

As we did for the ``frontend``, we'll also create a URL for the ``backend`` component.

```execute-1
odo url create backend --port 8080
```
With the component configuration created, you can ``push`` the Node.js source code from the current directory, ``backend``.

```execute-1
odo push
```
__NOTE__: Building the component may take 1-2 minutes to complete.

When the push completes, ``odo`` will display output similar to:

```bash
 Validation
 ✓  Checking component [23ms]

Configuration changes
 ✓  Initializing component
 ✓  Creating component [98ms]

Applying URL changes
 ✓  URL backend: http://backend-parksmap-odo-93101.apps.example.com created

Pushing to component backend of type local
 ✓  Checking files for pushing [486488ns]
 ✓  Waiting for component to start [39s]
 ✓  Syncing files to the component [31s]
 ✓  Building component [19s]
 ✓  Changes successfully pushed to component
 ```

Again, we can look at the logs to verify that our application is up and running:

```execute-1
odo log
```

You may need to run the command a few times before the app is ready. The message you need to see before continuing is:

```
Listening on 0.0.0.0, port 8080
```

Once we have our application up and running, we need to test it works.

This time we're going to test the application from command line, as it's a REST service.

```execute-2
curl http://backend-parksmap-%project_namespace%.%cluster_subdomain%/ws/info/
```

You should see the service's response, which should be similar to:

```bash
{"id":"nationalparks-js","displayName":"National Parks (JS)","type":"cluster","center":{"latit
ude":"47.039304","longitude":"14.505178"},"zoom":4}
```

Now, this component uses a database to store all the information it manages. We have not yet deployed any database and linked this component to it. Let's verify it. Let's tail the logs for our component:

```execute-1
odo log -f
```

Now let's query one of the endpoints that interacts with the database in the other terminal:

```execute-2
curl http://backend-parksmap-%project_namespace%.%cluster_subdomain%/ws/data/all
```

You should see an error message in our component log. That is expected. Let's move on and deploy a database and link that database to our backend.

Terminate the tailing log:

```execute-1
<ctrl+c>
```
