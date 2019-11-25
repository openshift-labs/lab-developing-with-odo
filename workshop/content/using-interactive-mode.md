In the last section, you deployed the sample app in just a few steps, by telling `odo` exactly what you wanted to do. `odo` also has an interactive mode for some commands, where the tool will prompt you for input and guide you through the process. 

Let's deploy the same sample app again, but this time we'll use interactive mode.

First, let's clone the repo to get the source code:



Get into the directory where the source code is located:

```execute-1
cd ~
git clone https://github.com/openshift-labs/beercan-shooter-game.git
cd beercan-shooter-game
```

Here, you will find the source code for the sample application. You can explore the source of our application:

```execute-1
ls
```

This time, when we create our component, we'll just enter the top level `odo create` command and let the tool guide us through the process of creating the component.

```execute-1
odo create
```

You will be prompted to enter selections for compnent type, version of Node.js, component name, etc.

Enter values matching the output shown below:

- Component type: `nodejs`
- Version of Node.js: `10`
- Which input type do you wish to use for the component: `local`
- Location of context component, relative to '/opt/app-root/src/interactive/beercan-shooter-game: `.`
- Component name: `sample`
- Which application do you want the commponent to be associated with: `app`
- Which project go you want the component to be created in: (<_ENTER_>)
- Do you wish to set advanced options: `No`

For all the remaining items, accept the defaults.

Next, create a URL:

```execute-1
odo url create --port 8080
```
Now that the component configuration is created, we need to create the component on the cluster and push our source code to it:

```execute-1
odo push
```

__NOTE__: Building the component may take 1-2 minutes to complete.

The output will look something like this:

```
Validation
 ✓  Checking component [22ms]

Configuration changes
 ✓  Initializing component
 ✓  Creating component [101ms]

Applying URL changes
 ✓  URL sample-8080: http://sample-8080-app-odo-93101.apps.cluster-osevg-bc9c.osevg-bc9c.exampl
e.opentlc.com created

Pushing to component sample of type local
 ✓  Checking files for pushing [1ms]
 ✓  Waiting for component to start [51s]
 ✓  Syncing files to the component [11s]
 ✓  Building component [33s]
 ✓  Changes successfully pushed to component
 ```

`odo` has pushed the code into the component, built the application, and started the application.

We can tail the logs to make sure the application is up and running:

```execute-1
odo log -f
```

You're looking for this message:

```
Listening on 0.0.0.0, port 8080
```

And then run:

```execute-1
<ctrl+c>
```

To visit your application, open a new browser window and paste the newly created URL into the address bar. You can run the following command to get the URL:

```execute-1
odo url list
```

At this point, you should be able to view your application, which is identical to the one you created in the previous exercise. The only difference is that you used interactive mode to create it this time.
