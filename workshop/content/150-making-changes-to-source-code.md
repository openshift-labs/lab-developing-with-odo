We've deployed the first version of our sample application and tested it by visiting it with a browser. Let's look at how OpenShift and odo help make it easier to iterate on that app once it's running.

First, make sure you're in the frontend codebase:

```execute-1
cd ~/frontend
```

Let's also make sure we're in the right directory on the lower terminal:

```execute-2
cd ~/frontend
```

Now we start the odo tool to *watch* for changes on the file system in the background:

```execute-2
odo watch
```

We will make a small change to the Concession Kiosk web page to append "by odo" to the title:

```execute-1
sed -i 's/Concession Kiosk/Concession Kiosk by odo/' views/index.ejs
```

There may be a slight delay before the watch recognizes the change. Once the change is recognized, you'll see output in the `odo watch` command indicating the `index.ejs` file has changed and is being pushed to the running container.

Once it does, refresh the Concession Kiosk web page to see the new title:

http://frontend-8080-concessions-%project_namespace%.%cluster_subdomain%/

Run the following to stop the watch command:

```execute-2
<ctrl+c>
```