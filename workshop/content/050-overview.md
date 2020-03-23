In the rest of this course, you will get a more detailed introduction to using  odo. The goal is to showcase odo and all of its functionality through the use of a sample 3-tier application. Don't focus too much on the code for this sample application as it has been developed for training purposes; the focus is on using odo

Now although the intent is to show as much as possible of what odo can do, because of how the workshop environment works, we have skipped how you can log in to OpenShift using odo. In the workshop environment, you have already been logged in from the terminal window. You also have a project created for you in advance.

However, when you are using odo outside of this lab, you can log into the cluster by using:

```bash
odo login <CLUSTER_URL>
```

The command will interactively prompt you for details of the user.

To create, change, or delete projects, you can use the `odo project` command. Run `odo project get` to show you the name of the current project you are working in:

```execute
odo project get
```

To see other operations you can perform on projects, run:

```execute
odo project --help
```

The `--help` option can be used on any `odo` command to see more details about what it can do.

Since we already have a project created for us, we don't need to create one for this workshop.
