---
Title: Creating a new binary component
PrevPage: 050-creating-an-application
NextPage: 061-exposing-components-to-public
---

A selection of runtimes, frameworks, and other components is available on an OpenShift cluster for building your applications.

``odo`` can connect to *OpenShift's Service Catalog* and provide a list of supported components and services. *Components* are the runtimes that the platform provides for you to build your component's source. We will see what services are in a later chapter.

To list the available component types in the catalog, run:

```execute-1
odo catalog list components
```

__NOTE__: Administrators can customize the service catalog, so the list will vary on different OpenShift clusters. For this workshop, the components we are interested in are ``java`` and ``nodejs``.

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

Use ``odo`` to create a configuration for a *component* named ``frontend``, of *component-type* ``java``. Because we had prebuilt the binary artifact for the application, we will use a binary build, supplying the path to the ``.jar`` file.

```execute-1
odo create java frontend --binary target/parksmap-web.jar --app parksmap
```

When the configuration for the component is created, ``odo`` will display output similar to that below,:

```bash
odo create java frontend --binary target/parksmap-web.jar --app parksmap
 ✓  Checking component
 ✓  Checking component version
Please use `odo push` command to create the component with source deployed
```

What does it mean for ``odo`` to create the configuration for a component? Let's take a look. 

```execute-1
ls -al .odo
```

You'll see there is a file named `config.yaml` in the `.odo` directory. That `config.yaml` file contains configuration for our component.

```execute-1
cat .odo/config.yaml
```

The file will look something like this:

```
kind: LocalConfig
apiversion: odo.openshift.io/v1alpha1
ComponentSettings:
  Type: java
  SourceLocation: target/parksmap-web.jar
  SourceType: binary
  Application: parksmap
  Project: odo-odo-lab-1mkhv
  Name: frontend
```

To view this in a more human-readable way, run:

```execute-1
odo config view
```

While we have this configuration defined, the application is not yet deployed on OpenShift.

When we run `odo push`, a container will be created with the Java application server and then, since this is a binary component, your JAR file will be pushed to that container.

To push up the binary artifact, run:

```execute-1
odo push
```

When the push completes, ``odo`` will display output similar to:

```
 ✓  Checking component
 ✓  Checking component version
 ✓  Creating java component with name frontend
 ✓  Initializing 'frontend' component
 ✓  Creating component frontend
 ✓  Successfully created component frontend
 ✓  Applying component settings to component: frontend
 ✓  The component frontend was updated successfully
 ✓  Successfully updated component with name: frontend
 ✓  Pushing changes to component: frontend of type binary
 ✓  Waiting for component to start
 ✓  Copying files to component
 ✓  Building component
 ✓  Changes successfully pushed to component: frontend
```

## Component configuration
When creating a component, some configuration will be inherited by default, but there is a way to override these defaults.

An example is the memory and cpu for your component. When deploying components in an OpenShift platform, ``odo`` will not impose any configuration for cpu and memory, but sometimes the platform does impose some values for the minimum and maximum cpu and memory a deployment can have.

If you want to explicitly set these values, you could have done before:

```
odo create java frontend \
    --binary target/parksmap-web.jar \
    --app parksmap \
    --memory 1Gi \
    --cpu 1
```

This will guarantee that your component will be created requesting 1 GB of memory as minimum and maximum and 1 CPU as minimum and maximum.

If you want your component to get some minimum values and grow if needed, you could also have done:

```
odo create java frontend \
    --binary target/parksmap-web.jar \
    --app parksmap \
    --min-memory 512Mi \
    --max-memory 1Gi \
    --min-cpu 0.5 \
    --max-cpu 1
```

You can also set environment variables for your component at creation time. These will be passed to your component and you will be able to use them within your application's code.

```
odo create java frontend --binary target/parksmap-web.jar \
    --app parksmap \
    --env DEBUG=true
```

Now that you've created the `frontend` component for the application and pushed it to your OpenShift cluster, let's look at how you can access the application frontend.