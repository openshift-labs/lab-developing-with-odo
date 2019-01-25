---
Title: Creating an application
PrevPage: 040-overview
NextPage: 060-creating-new-binary-component
---

Applications are often divided into components based on a logical division of labor. For example, an application might consist of a data-storage "backend" component that performs the application's primary work and permanently stores the results, paired with a user interface "frontend" component that accesses the backend to retrieve data and display it to a user.

As mentioned, applications often consist of two or more components that work together to implement the overall application. OpenShift helps organize these modular applications with a concept called, appropriately enough, the *application*. An OpenShift application represents all of an app's components in a logical management unit. The ``odo`` tool helps you manage that group of components and link them together, as an application.

We can verify all existing applications on our project:

```execute-1
odo app list
```

As you have already deployed the sample application, you should be able to see it listed.

Let's create a new one. We will name this application `parksmap`:

```execute-1
odo app create parksmap
```

One thing you should notice is how the prompt display has changed. This will not happen on every installation of ``odo`` but for this lab, we're displaying on the prompt text the name of the application you're working with and the name of the project you're working with.

Now, you can verify that you have two applications by executing the same command as before:

```execute-1
odo app list
```

When there are multiple applications, there will only be one active application at a time. To switch between applications you can do:

```
odo app set <app-name>
```

And to know what's your current application, you can do:

```execute-1
odo app get
```
