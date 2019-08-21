Once you have installed the CLI, you might want to configure some preferences/settings. Preferences are global behavior that will apply to the CLI or to all of the commands by default (unless a more specific configuration has been provided).

Run this command to view the values for global `odo` preferences:

```execute-1
odo preference view
```

The preference parameters are defined as follows:

**NamePrefix** - Default prefix is the current directory name. Use this value to set a default name prefix

**Timeout** - Timeout (in seconds) for OpenShift server connection check

**UpdateNotification** - Controls if an update notification is shown or not (true or false)

Like most of the configuration that modifies the behavior of a CLI, preferences can be set or unset.

```execute-1
odo preference set Timeout 20
```

To update this value:

```execute-1
odo preference set Timeout 30
```

Setting a previously set preference will prompt you for update confirmation.

And to remove this preference:

```execute-1
odo preference unset Timeout
```

As you can see, also removal of a preference will prompt you for confirmation.

As odo continues evolving more configuration will be added as preferences.