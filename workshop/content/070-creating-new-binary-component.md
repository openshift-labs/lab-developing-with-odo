A selection of runtimes, frameworks, and other components is available on an OpenShift cluster for building your applications.

`odo` can connect to *OpenShift's Service Catalog* and provide a list of supported components and services. *Components* are the runtimes that the platform provides for you to build your component's source. We will see what services are in a later exercise.

To list the available component types in the catalog, run:

```execute-1
odo catalog list components
```

__NOTE__: Administrators can customize the service catalog, so the list will vary on different OpenShift clusters. For this workshop, the components we are interested in are `java` and `nodejs`.

We're going to work now on a Java component for our application. The source code for this component is available [here](https://github.com/openshift-roadshow/concession-kiosk-backend-java) and has already been checked out and made available in the environment you are using.

To begin, change into the directory `backend`:

```execute-1
cd ~/backend
```

Take a look at the contents of the `backend` directory. It's a regular Java Spring Boot application using the Maven build system.

```execute-1
ls
```

Build the source files with Maven and create a JAR file by running:

```execute-1
mvn package
```

__NOTE__: This environment has an `.m2/repository` available so the build speed is comparable to what you would find on your local laptop on subsequent builds after the first.

With the frontend's JAR file built, the next step is to use `odo` to deploy and run it using the Java runtime we saw earlier in the software catalog.

We'll use `odo` to create a configuration for a *component* named `backend`, of *component-type* `java`. Because we had prebuilt the binary artifact for the application, we will use a binary build, supplying the path to the ``.jar`` file.

```execute-1
odo create java:8 backend --binary target/concessions-1.0.jar --app concessions
```

When the configuration for the component is created, `odo` will display output similar to that below:

```bash
odo create java:8 backend --binary target/concessions-1.0.jar --app concessions
 ✓  Validating component [10ms]
Please use `odo push` command to create the component with source deployed
```

What does it mean for `odo` to create the configuration for a component? Let's take a look.

```execute-1
ls -al .odo
```

You'll see there is a file named `config.yaml` in the `.odo` directory. That file contains configuration for our component.

```execute-1
cat .odo/config.yaml
```

The file will look something like this:

```
kind: LocalConfig
apiversion: odo.openshift.io/v1alpha1
ComponentSettings:
  Type: java:8
  SourceLocation: target/concessions-1.0.jar
  SourceType: binary
  Ports:
  - 8080/TCP
  - 8443/TCP
  - 8778/TCP
  Application: concessions
  Project: odo-12345
  Name: backend
```

To view this in a more human-readable way, run:

```execute-1
odo config view
```

Although the configuration has been defined, the application is not yet deployed on OpenShift. We will learn more about the component's configuration in the next step.

When we run `odo push`, a container will be created with the Java application server and, since this is a binary component, your pre-built JAR file will be pushed to that container.

```execute-1
odo push
```

When the push completes, ``odo`` will display output similar to:

```
Validation
 ✓  Checking component [19ms]

Configuration changes
 ✓  Initializing component
 ✓  Creating component [107ms]

Pushing to component frontend of type binary
 ✓  Checking files for pushing [2ms]
 ✓  Waiting for component to start [59s]
 ✓  Syncing files to the component [43s]
 ✓  Building component [3s]
```

At this point, the application is running as a container in the cluster. Before we move on to the database and frontend components, let's take a closer look at the types of configuration options odo provides.