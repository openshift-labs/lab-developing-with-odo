Typically, an image is worth more than a thousand words. In our world of technology, often times an example is worth the same.

For this exploratory introduction to `odo`, we have some working code that you'll deploy on the cluster. We understand that a quick intro should not make you code an entire application from scratch, but just show you how the tool works once you have your code ready to go.

Change to the directory where the source code is located:

```execute-1
cd sample
```

Here, you will find the source code for a simple Node.js application. You can explore the source for our application:

```execute-1
ls
```

As this application is built with Node.js, we are going to create a component configuration of type `nodejs`:

```execute-1
odo create nodejs
```

Later in the lab, you'll learn more about what takes place when you create a component configuration. But for now, let's move on to the next step.

We are going to want to be able to access the application in the browser once it's running. To be able to do that, we need to create a URL for our component that serve as the entry point to our application. Our application is using port 8080, so we've included that flag in the command.

```execute-1
odo url create --port 8080
```
Now that the component configuration is created, we need to deploy the component to the cluster and push our source code to it:

```execute-1
odo push
```

__NOTE__: Building the component may take 1-2 minutes to complete.

The output will look similar to the following:

```
Validation
 ✓  Checking component [21ms]

Configuration changes
 ✓  Initializing component
 ✓  Creating component [129ms]

Applying URL changes
 ✓  URL nodejs-sample-haxb-8080: http://nodejs-sample-haxb-8080-app-odo-93101.apps.example.com created

Pushing to component nodejs-sample-haxb of type local
 ✓  Checking files for pushing [1ms]
 ✓  Waiting for component to start [56s]
 ✓  Syncing files to the component [8s]
 ✓  Building component [36s]
 ✓  Changes successfully pushed to component
 ```

`odo` has pushed the code into a container on the cluster, built the application, and started it.

We can tail the logs to make sure the application is up and running:

```execute-1
odo log -f
```

You're looking for this message to show the applicaiton is running:

```
Listening on 0.0.0.0, port 8080
```

To exit the running log tail, run:

```execute-1
<ctrl+c>
```

To visit your application, open a new browser window and paste the newly created URL into the address bar. The following command shows all URLs for the component:

```execute-1
odo url list
```

This simple example shows how easy it is to use the tool, as it takes many decisions out of your way. In the following labs we're going to go deeper into how to use `odo` and what it is doing.

Before moving on, free up the lab project's resources by deleting this sample application using the command:

```execute-1
odo delete -a
```
