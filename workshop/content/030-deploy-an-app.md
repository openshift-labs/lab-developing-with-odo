---
Title: Deploying a sample application
PrevPage: 020-whats-odo
NextPage: 040-overview
---

Typically an image is worth more than a thousand words, but in our world of IT, also an example is worth the same.

Deploying an application in OpenShift is something that should be easy. Let's see if this is true.

For this exploratory introduction to `odo` we have some working code that you'll deploy on the platform, and access it. We understand that a quick intro should not make you code an application, but just show you how the tool works once you had your code ready to try.

Get into the directory where the source code is located:

```execute-1
cd sample
```

Here, you will find the source code for an simple node.js application. You can explore the source of our application:

```execute-1
ls
```

As this application is built with node.js, we are going to create a component in our platform of type nodejs to push our code to:

```execute-1
odo create nodejs
```

As you can read the output of the command, you should be able to understand what happened. Not only that, but you also have a hint to what should be your next step.

Once the component is available, we need to push our source code to it:

```execute-1
odo push
```

`odo` has pushed the code into the component, built the application, and run it.

Now the only thing left is verify that our application is running by accessing it from our browser. Let's create a URL for our component that will give us an entry point to our application.

```execute-1
odo url create
```

To visit your application, copy the URL from the terminal window, open a new browser window and paste it into the URL address bar.

This simple example shows how easy is to use the tool, as it takes many decisions out of your way. In the following labs we're going to go deeper into how to use `odo` and what it is doing.
