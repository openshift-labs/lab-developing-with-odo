---
Title: Making changes to source
PrevPage: 090-exposing-components-to-public
NextPage: 110-installing-odo
---

We've deployed the first version of our sample application and tested it by visiting it with a browser. Let's look at how OpenShift and ``odo`` help make it easier to iterate on that app once it's running.

First, we start the ``odo`` tool to ``watch`` for changes on the file system in the background:

```execute-2
odo watch
```

Let's change the displayed name for our wild west game. We edit the file `index.html`.

```execute-1
vi index.html
```

make a change to the file:

```execute-1
:1,$s/Wild West/Aussie Outback/
```

and save the file:

```execute-1
:w
```

There may be a slight delay before ``odo`` recognizes the change. Once the change is recognized, ``odo`` will push the changes to the ``frontend`` component and print its status to the terminal.

Once it does, refresh the application's page in the web browser. You will see the new name in the web interface for the application.

http://frontend-wildwest-%project_namespace%.%cluster_subdomain%
