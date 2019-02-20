---
Title: Deploying component from source code
PrevPage: 061-exposing-components-to-public
NextPage: 075-create-a-service
---

With the ``frontend`` component running, we are ready to bring up the backend component. Once again, source code for the component is already available in the environment you are using. Change directories to the ``backend`` directory.

```execute-1
cd ~/backend
```

Listing the contents of this directory shows that ``backend`` is a simple Node.js application.

```execute-1
ls
```

Since ``backend`` is written in an interpreted language, there is no build step analogous to the maven build we performed for the ``frontend`` component. We can proceed directly to selecting the ``nodejs`` environment from the cluster's software catalog.

We give this Node.js component the name ``backend``.

```execute-1
odo create nodejs backend
```

With the component named and created, you can ``push`` the Node.js source code from the current directory, ``backend``.

```execute-1
odo push
```

When the push completes, ``odo`` will display output similar to:

```bash
Pushing changes to component: backend
 ✓   Waiting for pod to start
 ✓   Copying files to pod
 ✓   Building component
 OK  Changes successfully pushed to component: backend
```

Again, we can tail the logs to verify that our application is up and running:

```execute-1
odo log -f
```

Select the terminal window and enter:

```execute-1
<ctrl+c>
```

when you're finished checking out the logs.

Once we have our application up and running, we need to test it works. We're going to create a URL for it, as we did before for the frontend.

```execute-1
odo url create backend
```

Note how this time you don't need to specify the port, as this component only exposes one port, 8080.

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

Terminate the tailing log by entering:

```execute-1
<ctrl+c>
```

in that terminal.
