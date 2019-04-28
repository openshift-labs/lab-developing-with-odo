---
Title: Interacting with OpenShift
PrevPage: 030-deploy-an-app
NextPage: 050-creating-an-application
---

In this course you will get a __deep__ introduction to the tool ``odo``. This tool provides a simplified command line client for deploying applications to OpenShift.

The goal for this lab is to showcase `odo` and all of its primitives and to do so we're going to use a sample application. Don't judge the code for this sample application as it has been developed just for training purposes.

Now although the intent is to show as much as possible of what `odo` can do, because of how the workshop environment works, we have skipped how you can log in to OpenShift using `odo`. In the workshop environment, you have already been logged in from the terminal window. You also have a project created for you in advance.

### Authentication

If you were using `odo` with your own cluster, you could log in to the cluster by using:

```bash
odo login
```

The command will interactively prompt you for details of the cluster. Alternatively you could supply the address of the OpenShift cluster as an argument.

### Projects

To create, change, or delete projects, you can use the `odo project` command. Run `odo project get` to show you the name of the current project you are working in:

```execute
odo project get
```

To see other operations you can perform on projects, run:

```execute
odo project --help
```

The `--help` option can be used on any `odo` command to see more details about what it can do.

Since we already have a project created for us, we are good to go though, and do not need to create one.

## Component configuration and global preferences

There are a couple other commands you can run to view component configuration and `odo` preferences that are global.

Run this command to view the values for global `odo` preferences:

```execute-1
odo preference view
```

The preference parameters are defined as follows:


**NamePrefix** - Default prefix is the current directory name. Use this value to set a default name prefix

**Timeout** - Timeout (in seconds) for OpenShift server connection check

**UpdateNotification** - Controls if an update notification is shown or not (true or false)


To view the current component configuration, run this command:

```execute-1
odo config view
```

The component configuration parameters are defined as follows:


**Application** - Application is the name of application the component needs to be part of

**CPU** - The minimum and maximum CPU a component can consume

**Ignore** - Consider the .odoignore file for push and watch

**MaxCPU** - The maximum CPU a component can consume

**MaxMemory** - The maximum memory a component can consume

**Memory** - The minimum and maximum memory a component can consume

**MinCPU** - The minimum CPU a component can consume

**MinMemory** - The minimum memory a component is provided

**Name** - The name of the component

**Ports** - Ports to be opened in the component

**Project** - Project is the name of the project the component is part of

**Ref** - Git ref to use for creating component from git source

**SourceLocation** - The path indicates the location of binary file or git source

**SourceType** - Type of component source - git/binary/local

**Type** - The type of component

**Url** - URL to access the component


