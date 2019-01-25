---
Title: Making changes to source
PrevPage: 090-exposing-components-to-public
NextPage: 105-whats-next
---

We've deployed the first version of our sample application and tested it by visiting it with a browser. Let's look at how OpenShift and ``odo`` help make it easier to iterate on that app once it's running.

Let's first get back to our `nodejs backend` component.

```execute-1
odo component set frontend
```

Let's also make sure we're in the right directory on both terminals:

```execute-1
cd ~/frontend
```

```execute-2
cd ~/frontend
```

First, we start the ``odo`` tool to ``watch`` for changes on the file system in the background:

```execute-2
odo watch
```

Let's change the displayed name for our backend. We edit the file `bin/config.js`.

```execute-1
vi bin/config.js
```

make a change to the file:

```execute-1
:1,$s/National Parks/Worldwide national parks/
```

and save the file:

```execute-1
:w
```

There may be a slight delay before ``odo`` recognizes the change. Once the change is recognized, ``odo`` will push the changes to the ``frontend`` component and print its status to the terminal.

Once it does, make a new query to the REST endpoint to validate it has changed.

```execute-1
curl http://backend-parksmap-%project_namespace%.%cluster_subdomain%/ws/info/
```

__NOTE__: The same bug as before also makes the watch operation missbehave and be slow. As we said before, this will be fixed in the coming week. Trust us :-D

Enter `Ctrl+C` in the terminal below to end the watch command.
