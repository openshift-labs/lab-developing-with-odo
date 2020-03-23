In the previous step, we deployed our sample application's backend component. While this component exposes 3 different ports, we need to explicitly define that 8080 is the one we want for our external access. Let's create an external URL for our application so we can see it in action:

```execute-1
odo url create backend --port 8080
```

Similar to when we create a component, creating a URL sets that information in the component configuration, but it doesn't get applied to your OpenShift cluster until you run `odo push`.

```execute-1
odo push --show-log
```

As the `odo push` is executing, watch the logs in the lower terminal and wait until the component is ready by running the following:

```execute-2
cd ~/backend
odo log -f
```

In the upper terminal you should see:

```
Validation
 ✓  Checking component [22ms]

Configuration changes
 ✓  Retrieving component data [21ms]
 ✓  Applying configuration [35s]

Applying URL changes
 ✓  URL backend: http://backend-concessions-odo-12345.apps-crc.testing created

Pushing to component backend of type binary
 ✓  Checking file changes for pushing [1ms]
 ✓  No file changes detected, skipping build. Use the '-f' flag to force the build.
```

In the lower terminal, you're looking for a message like this:

```
2020-03-23 14:47:02.924  INFO 33 --- [           main] c.r.o.c.ConcessionsApplication           : Started ConcessionsApplication in 5.224 seconds (JVM running for 6.115)
```

__NOTE__: You may see errors in the component logs. This is expected; we haven't yet hooked up the database. We'll do that later in the workshop.

Once you see that, run `ctrl+c` to stop the log tracking:

```execute-2
<ctrl+c>
```

The URL created for the application will be displayed in the output of the `odo push` command. Alternatively, you can display all of the component URLs:

```execute-1
odo url list
```

The backend application was written with a debugging endpoint to show that the application is running and provide information on whether or not a database is connected. We can check that endpoint with the following command:

```execute-1
curl http://backend-concessions-%project_namespace%.%cluster_subdomain%/debug
```

__NOTE__: When you don't specify a name for the URL to be created, it will default to the name of the component and port, e.g. `http://backend-concessions-%project_namespace%.%cluster_subdomain%`
