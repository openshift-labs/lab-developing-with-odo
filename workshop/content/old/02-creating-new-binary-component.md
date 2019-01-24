---
Title: Creating a new binary component
PrevPage: 01-creating-an-application
NextPage: 03-deploying-component-from-source-code
---

A selection of runtimes, frameworks, and other components is available on an OpenShift cluster for building your applications. This list is referred to as the *Software Catalog*. To list the support component types in the catalog, run:

```execute-1
odo catalog list components
```

Sites can customize the software catalog, so the list will vary on different OpenShift clusters. For this course, the components we are interested in are ``java`` and ``nodejs``.

Source code for the ``wildwest`` application has already been checked out and made available in the environment you are using.

Starting with the application backend, change into the directory ``backend``:

```execute-1
cd ~/backend
```

Take a look at the contents of the `backend` directory. It's a regular Java Spring Boot application using the Maven build system.

```execute-1
ls
```

To build the ``backend`` source files with Maven and create a JAR file, run:

```execute-1
mvn package
```

We have previously run a Maven build for you for this environment, so it should complete fairly quickly. If it was a fresh Maven build it would take a few minutes to complete.

With the backend's ``.jar`` file built, the next step is to use `odo` to deploy and run it atop the Java application server we saw earlier in the software catalog.

Use ``odo`` to create a *component* named ``backend``, of *component-type* ``java``. Because we had prebuilt the binary artifact for the application, we will use a binary build, supplying the path to the ``.jar`` file.

```execute-1
odo create java backend --binary target/wildwest-1.0.jar
```

When the container is created, ``odo`` will display output similar to that below, telling you what it is doing:

```
✓   Checking component
✓   Checking component version
✓   Creating component backend
OK  Component 'backend' was created and ports 8778/TCP,8080/TCP,8443/TCP were opened
OK  Component 'backend' is now set as active component
To push source code to the component run 'odo push'
```

The application is not yet deployed on OpenShift. With a single ``odo create`` command, OpenShift has created a container with the Java application server ready to have your application deployed to it. This container is not pushed into OpenShift's integrated container registry as it will be used for developing your application in an iterative way. This container is deployed into a pod running on the OpenShift cluster.

Let's verify that the component exists already on the platform and is ready for your application:

```execute-1
odo list
```

This should report one component, named ``backend``:

```
ACTIVE     NAME        TYPE
*          backend     java
```

Since ``backend`` is a binary component, as specified in the ``odo create`` command above, changes to the program's source code should be followed by pushing the artifact to the running container. After ``mvn`` compiled a new JAR file, the updated program would be updated in the ``backend`` component with the ``odo push`` subcommand. To push up the binary, run:

```execute-1
odo push
```

When the push completes, ``odo`` will display output similar to:

```
Pushing changes to component: backend
 ✓   Waiting for pod to start
 ✓   Copying files to pod
 ✓   Building component
 OK  Changes successfully pushed to component: backend
```

As you would probably have noticed, the artifact has been pushed to the container, and the process in that container restarted.
