The `odo` tool is a single executable written in the Go
programming language and is available for the following operating systems:

- Microsoft Windows 10 (or later)
- macOS 10
- Linux

You might already have `odo` available on your environment. You can verify it by running an `odo` command:

```bash
odo version
```

You should see the following (or something similar):

```bash
odo v1.0.0-beta1 (c226b008)
```

If the `odo` command doesn't exist or you have an older version of it, follow the next sections to install or update the `odo` tool. Otherwise, skip to the next page.

## Download and Install odo CLI on Windows

Download the the odo CLI tool for link: [Microsoft Windows](https://github.com/openshift/odo/releases/download/v1.0.0-beta1/odo-windows-amd64.exe.gz)

Once the file has been downloaded, you will need to extract the contents as it
is a compressed archive. I would suggest saving this file to the following directory:

```bash
C:\odo
```

In order to extract a gzip archive on windows, you will need a gzip utility
installed on your system. With newer versions of windows (greater than XP),
this is provided by the operating system. Just right click on the downloaded
file using file explorer and select to extract the contents.

Now you can add the odo CLI tools to your PATH. Because changing your PATH
on windows varies by version of the operating system, we will not list each operating system here.
However, the general workflow is right click on your computer name inside of the file explorer. Select Advanced system settings. I guess changing your PATH is considered an advanced task? :) Click on the advanced tab, and then finally click on Environment variables.
Once the new dialog opens, select the Path variable and add *`;C:\odo`* at
the end. For an easy way out, you could always just copy it to C:\Windows or a
directory you know is already on your path.

__NOTE:__ odo is only supported on Windows 10.

At this point, we should have the odo tool available for use. Let's test this
out by printing the version of the odo command:

```bash
> odo version
```

You should see the following (or something similar):

```bash
odo v1.0.0-beta1 (c226b008)
```

If you get an error message, you have not updated your path correctly. If you
need help, raise your hand and the instructor will assist.

## Download and Install odo CLI on Linux

Download the the odo CLI tool for [Linux 64](https://github.com/openshift/odo/releases/download/v1.0.0-beta1/odo-linux-amd64.gz)

Once the file has been downloaded, you will need to extract the contents as it
is a compressed archive. I would suggest saving this file to the following
directories:

```bash
~/odo
```

Open up a terminal window and change to the directory where you downloaded the
file.  Once you are in the directory, enter in the following command:

CAUTION: The name of the oc packaged archive may vary. Adjust accordingly.

```bash
gunzip odo-linux-amd64.gz
```

Now you can add the odo CLI tools to your PATH.

```bash
export PATH=$PATH:~/odo
```

At this point, we should have the odo tool available for use. Let's test this
out by printing the version of the odo command:

```bash
odo version
```

You should see the following (or something similar):

```bash
odo v1.0.0-beta1 (c226b008)
```

If you get an error message, you have not updated your path correctly. If you
need help, raise your hand and the instructor will assist.

## Download and Install odo CLI on Mac

Download the the odo CLI tool for [Mac OS](https://github.com/openshift/odo/releases/download/v1.0.0-beta1/odo-darwin-amd64.gz)

Once the file has been downloaded, you will need to extract the contents as it
is a compressed archive. I would suggest saving this file to the following
directories:

```bash
~/odo
```

Open up a terminal window and change to the directory where you downloaded the
file. Once you are in the directory, enter in the following command:

```bash
gunzip odo-darwin-amd64.gz
```

Now you can add the odo CLI tools to your PATH.

```bash
export PATH=$PATH:~/odo
```

At this point, we should have the odo tool available for use. Let's test this
out by printing the version of the odo command:

```bash
odo version
```

You should see the following (or something similar):

```bash
odo v1.0.0-beta1 (c226b008)
```

If you get an error message, you have not updated your path correctly. If you
need help, raise your hand and the instructor will assist.

## Tab Completion

The odo command line tool supports the ability to use tab completion for the popular zsh and bash shells.  This suits the needs of users using either Linux or OS X. If you are using Microsoft Windows, never fear, we will discuss some ways to get tab completion working on that operating system as well.

### Tab completion on Mac and Linux

To enable tab completion in your shell, you can simply enter in the following command from your terminal

```bash
odo --complete
```

This will add the corresponding completion configuration to your shell configuration file. After any modification to your shell configuration file, you will need to source it or restart your shell.

To disable completion, run:

```bash
odo --uncomplete
```

__NOTE__: The completion system will stop working if you either rename the odo executable or move it. You will therefore need to re-enable it accordingly.

## Further documentation

For a list of other methods such as installing the latest master binary, or specific OS installations, visit the [installation page](https://github.com/openshift/odo/blob/master/docs/installation.adoc)
