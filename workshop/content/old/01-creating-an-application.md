---
Title: Creating an application
PrevPage: 00-application-overview
NextPage: 02-creating-new-binary-component
---

As mentioned, applications often consist of two or more components that work together to implement the overall application. OpenShift helps organize these modular applications with a concept called, appropriately enough, the *application*. An OpenShift application represents all of an app's components in a logical management unit. The ``odo`` tool helps you manage that group of components and link them together, as an application.

First, we create an application to work with. We name our application `wildwest`:

```execute-1
odo app create wildwest
```

You can list the applications ``odo`` is managing using:

```execute-1
odo app list
```

Since we began with an empty environment, only the ``wildwest`` application is listed.
