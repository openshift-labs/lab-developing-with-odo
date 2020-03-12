Applications are often divided into components based on a logical division of labor. For example, an application might consist of a data-storage "backend" component that performs the application's primary work and permanently stores the results paired with a user interface "frontend" component that accesses the backend to retrieve data and display it to a user.

As mentioned, applications often consist of two or more components that work together to implement the overall application. OpenShift helps organize these modular applications with a concept called, appropriately enough, the *application*. An OpenShift application represents all of an app's components in a logical management unit. The ``odo`` tool helps you manage that group of components and link them together as an application.

We can verify all existing applications on our project:

```execute-1
odo app list
```

You should see output similar to this:

```
The project 'odo-odo-lab-1mkhv' has the following applications:
NAME
app
```

As you have already deployed the sample application, you should be able to see it listed. When you deployed the sample application, you didn't explicitly tell `odo` to create an application: It was done for you. In most cases, you do not need to explicitly set or specify an application name.

However, you can do so if you choose for more complex, multi-component applications.

In the rest of the lab, we will use the application name `parksmap` for any components, services, etc. that we create in our application.
