Applications are often divided into components based on a logical division of labor. For example, an application might consist of a data-storage "backend" component that performs the application's primary work and permanently stores the results paired with a user interface "frontend" component that accesses the backend to retrieve data and display it to a user.

As mentioned, applications often consist of two or more components that work together to implement the overall application. OpenShift helps organize these modular applications with a concept called, appropriately enough, the *application*. An OpenShift application represents all of it's components in a logical management unit. The `odo` tool helps you manage that group of components and link them together as an application.

We can verify all existing applications on our project:

```execute-1
odo app list
```

You should see output similar to this:

```
There are no applications deployed in the project 'lab'
```

Since you cleaned up the sample applications from the earlier examples, there shouldn't be any applications listed.

When you deployed the sample applications from the earlier examples, you didn't explicitly tell odo to create an application; it was done for you. In most cases, you do not need to explicitly set or specify an application name. However, you can do so if you choose for more complex, multi-component applications.

In the rest of the lab, we will use the application name `concessions` for any components, services, etc. that we create.
