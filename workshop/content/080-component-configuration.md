When creating a component, odo sets sensible defaults that may be overridden if necessary.

One example is the memory and cpu for your component. When deploying components in an OpenShift platform, `odo` will not impose any configuration for cpu and memory. However, the cluster may be configured to enforce maximum values for these resources.

These values may be explicitly set during the component creation. For example, the command from the previous step can be enhanced with these settings:

```
odo create java backend \
    --binary target/concessions-1.0.jar \
    --app concessions \
    --memory 1Gi \
    --cpu 1
```

This will guarantee that your component will request 1 GB of memory as minimum and maximum and 1 CPU as minimum and maximum.

If you want your component to set some minimum values and grow if needed, you could also have done:

```
odo create java backend \
    --binary target/concessions-1.0.jar \
    --app concessions \
    --min-memory 512Mi \
    --max-memory 1Gi \
    --min-cpu 0.5 \
    --max-cpu 1
```

You can also set environment variables for your component at creation time. These will be passed to your component and you will be able to use them within your application's code.

```
odo create java backend --binary target/concessions-1.0.jar \
    --app concessions \
    --env DEBUG=true
```

Similar to git, odo stores it's configuration in a local folder inside of the project named `.odo`. As we have seen, we can see the information within using odo itself:

```execute-1
odo config view
```

The component configuration parameters are defined as follows:

* **Application** - Application is the name of application the component is part of
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

More configuration options will come as odo evolves.

In addition to setting configuration values at deploy time, the same mechanism can be used to edit the configuration of an existing component:

```execute-1
odo config set --env DEV_MODE=true
```

We can now see the new variable at the top of the output under `ENVIRONMENT VARIABLES`:

```execute-1
odo config view
```

Since the odo configuration is stored as plain-text files in the project directory, it can be stored and tracked via version control. Upon cloning the project, it can be deployed in a single step:

```
git clone <COMPONENT_GIT_URL>
odo push
```