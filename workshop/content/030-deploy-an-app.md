---
Title: Deploying a sample application
PrevPage: 020-whats-odo
NextPage: 040-overview
---

Typically an image is worth more than a thousand words, but in our world of IT, also an example is worth the same.

Deploying an application in OpenShift is something that should be easy. Let's see if this is true.

For this exploratory introduction to `odo` we have some working code that you'll deploy on the platform, and access it. We understand that a quick intro should not make you code an application, but just show you how the tool works once you have your code ready to try.

Get into the directory where the source code is located:

```execute-1
cd sample
```

Here, you will find the source code for an simple Node.js application. You can explore the source of our application:

```execute-1
ls
```

As this application is built with Node.js, we are going to create a component configuration in our platform of type nodejs to push our code to:

```execute-1
odo create nodejs
```

Later in the lab, you'll learn more about what takes place when you create a component configuration. But for now, let's move on to the next step.

We are going to want to be able to access the application in the browser once it's running. To be able to do that, let's create a URL for our component that will give us an entry point to our application. Our application is using port 8080, so we've included that flag in the command.

```execute-1
odo url create --port 8080
```
Now that the component configuration is created, we need to create the component on the cluster and push our source code to it:

```execute-1
odo push
```

The output will look something like this:

```
 ✓  Checking component
 ✓  Checking component version
 ✓  Creating nodejs component with name nodejs-tgfc
 ✓  Initializing 'nodejs-tgfc' component
 ✓  Creating component nodejs-tgfc
 ✓  Successfully created component nodejs-tgfc
 ✓  Applying component settings to component: nodejs-tgfc
 ✓  Checking URL nodejs-tgfc-8080
 ✓  Successfully created URL for component: nodejs-tgfc
 ✓  http://nodejs-tgfc-8080-app-odo-odo-lab-53wy0.apps.osevg-e293.openshiftworkshop.com
 ✓  The component nodejs-tgfc was updated successfully
 ✓  Successfully updated component with name: nodejs-tgfc
 ✓  Pushing changes to component: nodejs-tgfc of type local
 ✓  Waiting for component to start
 ✓  Copying files to component
 ✓  Building component
 ✓  Changes successfully pushed to component: nodejs-tgfc
 ```

`odo` has pushed the code into the component, built the application, and run it.

We can tail the logs to make sure the application is up and running:

```execute-1
odo log -f
```

You're looking for this message:

```
Listening on 0.0.0.0, port 8080
```

And then run:

```execute-1
<ctrl+c>
```

To visit your application, copy the URL from the top terminal window, open a new browser window and paste it into the URL address bar.

Alternatively, you can run the following command to get the URL:

```execute-1
odo url list
```

This simple example shows how easy it is to use the tool, as it takes many decisions out of your way. In the following labs we're going to go deeper into how to use `odo` and what it is doing.
