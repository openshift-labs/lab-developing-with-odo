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
- Location of context component, relative to '/opt/app-root/src/interactive/beercan-shooter-game: `/`
- Input type: `local`
- Component name: `sample`

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
 ✓  Checking component
 ✓  Checking component version
 ✓  Creating nodejs component with name sample
 ✓  Initializing 'sample' component
 ✓  Creating component sample
 ✓  Successfully created component sample
 ✓  Applying component settings to component: sample
 ✓  Checking URL sample-8080
 ✓  Successfully created URL for component: sample
 ✓  http://sample-8080-app-developing-with-odo-jan-workshop1-k4vjq.apps.jkleinert-7a77.opensh
iftworkshop.com
 ✓  The component sample was updated successfully
 ✓  Successfully updated component with name: sample
 ✓  Pushing changes to component: sample of type local
 ✓  Waiting for component to start
 ✓  Copying files to component
 ✓  Building component
 ✓  Changes successfully pushed to component: sample
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
