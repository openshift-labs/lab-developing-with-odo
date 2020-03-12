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

Odo, like git, stores it's configuration on a local folder `.odo`. As we have seen, we can see the component's configuration easily:

```execute-1
odo config view
```

The component configuration parameters are defined as follows:

* **Application** - Application is the name of application the component needs to be part of
* **CPU** - The minimum and maximum CPU a component can consume
* **Ignore** - Consider the .odoignore file for push and watch
* **MaxCPU** - The maximum CPU a component can consume
* **MaxMemory** - The maximum memory a component can consume
* **Memory** - The minimum and maximum memory a component can consume
* **MinCPU** - The minimum CPU a component can consume
* **MinMemory** - The minimum memory a component is provided
* **Name** - The name of the component
* **Ports** - Ports to be opened in the component
* **Project** - Project is the name of the project the component is part of
* **Ref** - Git ref to use for creating component from git source
* **SourceLocation** - The path indicates the location of binary file or git source
* **SourceType** - Type of component source - git/binary/local
* **Type** - The type of component
* **Url** - URL to access the component

More will come as odo evolves.

But not only you can set predefined configuration, which will affect how your application will be deployed. When your application needs some configuration, this is the same mechanism to configure it.

Let's add a configuration to our current component:

```execute-1
odo config set --env DEV_MODE=true
```

We can now see the new configuration defined at the top of the output as `Environment variables`:

```execute-1
odo config view
```

One thing that you can now think is that, if we have a component already configured in Version Control with odo configuration in place, we can easily deploy the component in one step:

```
git clone <COMPONENT_GIT_URL>
odo push
```

Soon you'll find many projects with odo configuration in place. For you to work with these applications you will only need to execute a simple command. Isn't that cool!
