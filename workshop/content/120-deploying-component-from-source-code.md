With the `backend` component running, we are ready to bring up the frontend component. Once again, source code for the component is already available in the environment you are using. Change directories to the `frontend` directory.

```execute-1
cd ~/frontend
```

Listing the contents of this directory shows the application is a simple Node.js application.

```execute-1
ls
```

Since the frontend is written in an interpreted language, there is no build step analogous to the Maven build we performed for the backend component. We can proceed directly to selecting the ``nodejs`` environment from the cluster's component catalog. We'll give this Node.js component the name `frontend` and make sure to put it in our `concessions` app.

```execute-1
odo create nodejs frontend --app concessions
```

As we did for the backend, we'll also create a URL for the new component. Since there is only one possible port, we can omit the `--port` argument that was needed for the backend. Also, as we're in the frontend project directory, odo will determine the component name from the metadata in the `.odo` directory:

```execute-1
odo url create
```

We can see the newly created URL through the `list` subcommand:

```execute-1
odo url list
```

With the component configuration set, you can use the `push` subcommand to deploy the application:

```execute-1
odo push
```

__NOTE__: Building the component may take 1-2 minutes to complete.

When the push completes, ``odo`` will display output similar to:

```bash
Validation
 ✓  Checking component [14ms]

Configuration changes
 ✓  Initializing component
 ✓  Creating component [201ms]

Applying URL changes
 ✓  URL frontend-8080: http://frontend-8080-concessions-odo-12345.apps-crc.testing created

Pushing to component frontend of type local
 ✓  Checking files for pushing [3ms]
 ✓  Waiting for component to start [23s]
 ✓  Syncing files to the component [22s]
 ✓  Building component [9s]
 ✓  Changes successfully pushed to component
 ```

As with the backend, we can look at the logs to verify that our application is up and running:

```execute-1
odo log
```

You may need to run the command a few times before the app is ready. The message you need to see before continuing is:

```
[nodemon] starting `node ./bin/www --inspect=5858`
```

Once we have our application up and running, we need to test it works. Open the following URL in a new browser:

http://frontend-8080-concessions-%project_namespace%.%cluster_subdomain%/

The first page renders, but if you try to submit an order, you'll receive an error. Before it will work, we need to link the frontend and backend components.