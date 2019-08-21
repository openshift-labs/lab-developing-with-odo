We've deployed the first version of our sample application and tested it by visiting it with a browser. Let's look at how OpenShift and ``odo`` help make it easier to iterate on that app once it's running.

Let's first get back to our `backend` component.

```execute-1
cd ~/backend
```

Let's also make sure we're in the right directory on the lower terminal:

```execute-2
cd ~/backend
```

Now we start the ``odo`` tool to ``watch`` for changes on the file system in the background:

```execute-2
odo watch
```

We will make a small change to the displayed name for our backend from "National Parks" to "Worldwide National Parks". To change the displayed name for our backend, we edit the file `bin/config.js`.

```execute-1
vi bin/config.js
```

Make a change to the file:

```execute-1
:1,$s/National Parks/Worldwide National Parks/
```

Save the file:

```execute-1
:wq
```

There may be a slight delay before ``odo`` recognizes the change. Once the change is recognized, ``odo`` will push the changes to the ``frontend`` component and print its status to the terminal.

Once it does, make a new query to the REST endpoint to validate it has changed.

```execute-1
curl http://backend-parksmap-%project_namespace%.%cluster_subdomain%/ws/info/
```

__NOTE__: The same bug as before also makes the watch operation be slow. As we said before, this will be fixed in the coming week. Trust us :-D

You can expect to see the following to verify the backend successfully redeployed:

```
{"id":"nationalparks-js","displayName":"Worldwide National Parks (JS)","type":"cluster","center":{"latitude":"4
7.039304","longitude":"14.505178"},"zoom":4}
```

Run the following to stop the watch command:

```execute-2
<ctrl+c>
```
