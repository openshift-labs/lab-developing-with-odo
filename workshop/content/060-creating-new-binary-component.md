---
Title: Creating a new binary component
PrevPage: 050-creating-an-application
NextPage: 061-exposing-components-to-public
---

A selection of runtimes, frameworks, and other components is available on an OpenShift cluster for building your applications.

``odo`` can connect to *OpenShift's Software Catalog* and provide a list of supported components and services. *Components* are the runtimes that the platform provides for you to build your component's source. We will see what services are in a later chapter.

To list the available component types in the catalog, run:

```execute-1
odo catalog list components
```

__NOTE__: Sites can customize the software catalog, so the list will vary on different OpenShift clusters. For this course, the components we are interested in are ``java`` and ``nodejs``.

We're going to work now on a ``Java`` component that is part of our application. The source code for this component, that lives in:

https://github.com/grahamdumpleton/parksmap-web

has already been checked out and made available in the environment you are using.

Starting with the application frontend, change into the directory ``frontend``:

```execute-1
cd ~/frontend
```

Take a look at the contents of the `frontend` directory. It's a regular Java Spring Boot application using the Maven build system.

```execute-1
ls
```

To build the ``frontend`` source files with Maven and create a JAR file, run:

```execute-1
mvn package
```

__NOTE__: This environment has an .m2/repository available so the build speed is comparable to what you would find on your local laptop anytime after your first build.

With the frontend's ``.jar`` file built, the next step is to use `odo` to deploy and run it atop the Java runtime we saw earlier in the software catalog.

Use ``odo`` to create a *component* named ``frontend``, of *component-type* ``java``. Because we had prebuilt the binary artifact for the application, we will use a binary build, supplying the path to the ``.jar`` file.

```execute-1
odo create java frontend --binary target/parksmap-web.jar
```

When the container is created, ``odo`` will display output similar to that below, telling you what it is doing:

```bash
✓   Checking component
✓   Checking component version
✓   Creating component backend
OK  Component 'frontend' was created and ports 8778/TCP,8080/TCP,8443/TCP were opened
OK  Component 'frontend' is now set as active component
To push source code to the component run 'odo push'
```

The application is not yet deployed on OpenShift. With a single ``odo create`` command, OpenShift has created a container with the Java application server ready to have your application deployed to it. This container is not pushed into OpenShift's integrated container registry as it will be used for developing your application in an iterative way. This container is deployed into a pod running on the OpenShift cluster.

Let's verify that the component exists already on the platform and is ready for your application:

```execute-1
odo list
```

This should report one component, named ``frontend``:

```
ACTIVE     NAME        TYPE
*          frontend     java
```

Since ``frontend`` is a binary component, as specified in the ``odo create`` command above, changes to the program's source code should be followed by pushing the artifact to the running container. After ``mvn`` compiled a new JAR file, the updated program would be updated in the ``frontend`` component with the ``odo push`` command. To push up the binary, run:

```execute-1
odo push
```

When the push completes, ``odo`` will display output similar to:

```
Pushing changes to component: frontend
 ✓   Waiting for pod to start
 ✓   Copying files to pod
 ✓   Building component
 OK  Changes successfully pushed to component: frontend
```

As you would probably have noticed, the artifact has been pushed to the container, and the process in that container restarted.

You can verify that the Java runtime has started your application by tailing the logs for your component:

```execute-1
odo log -f
```

Select the terminal window and enter:

```execute-1
<ctrl+c>
```

when you're finished checking out the logs.

## Component configuration
When creating a component, some configuration will be inherited by default, but there is a way to override these defaults.

An example is the memory and cpu for you component. When deploying components in an OpenShift platform, ``odo`` will not impose any configuration for cpu and memory, but sometimes the platform does impose some values for the minimum and maximum cpu and memory a deployment can have.

If you want to explicitly set these values, you could have done before:

```
odo create java frontend --binary target/parksmap-web.jar \
    --memory 1Gi --cpu 1
```

This will guarantee that your component will be created requesting 1 GB of memory as minimum and maximum and 1 CPU as minimum and maximum.

If you want your component to get some minimum values and grow if needed, you could also have done:

```
odo create java frontend --binary target/parksmap-web.jar \
    --min-memory 512Mi \
    --max-memory 1Gi \
    --min-cpu 0.5 \
    --max-cpu 1
```

You can also set environment variables for you component at creation time. These will be passed to your component and you will be able to use them within your application's code.

```
odo create java frontend --binary target/parksmap-web.jar \
    --env DEBUG=true
```
