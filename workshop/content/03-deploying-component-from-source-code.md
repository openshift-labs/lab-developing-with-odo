---
Title: Deploying component from source code
PrevPage: 02-creating-new-binary-component.md
NextPage: 04-linking-application-components.md
---

With the ``backend`` component running, we are ready to bring up the frontend component and connect it to the backend. Once again, source code for the component is already available in the environment you are using. Change directories to the ``frontend`` directory.

```execute-1
cd ~/frontend
```

Listing the contents of this directory shows that ``frontend`` is a simple Node.js application.

```execute-1
ls
```

Since ``frontend`` is written in an interpreted language, there is no build step analogous to the maven build we performed for the ``backend`` component. We can proceed directly to selecting the ``nodejs`` environment from the cluster's software catalog.

We give this Node.js component the name ``frontend``.

```execute-1
odo create nodejs frontend
```

With the component named and created, you can ``push`` the Node.js source code from the current directory, ``frontend``.

```execute-1
odo push
```

When the push completes, ``odo`` will display output similar to:

```
Pushing changes to component: frontend
 ✓   Waiting for pod to start
 ✓   Copying files to pod
 ✓   Building component
 OK  Changes successfully pushed to component: frontend
```

Again, we can tail the logs to verify that our application is up and running:

```execute-1
odo log -f
```

Hit `Crtl+C` when you're doing following the logs.