---
Title: Linking components to services
PrevPage: 080-linking-components-to-services
NextPage: 090-exposing-components-to-public
---

Now that our backend is fully functional, we need to connect to it from our `frontend` so they can communicate.

As we're going to execute some actions with the `frontend` component, we need to set it as our active component.

__NOTE__: In the near future, the current component will be defined by the directory you're in with your shell, just like *Git* does. For now, there's a way to get and change the current selected component to which some of this commands will relate.

To get a list of existing components within your application do:

```execute-1
odo list
```

You will see similar output to this:

```bash
odo list
ACTIVE     NAME         TYPE
*          backend      nodejs
           frontend     java
```

The active component is the `backend`. You can either take one of two paths, change your active component and execute the `in-context` actions on it or we can specify to any command to which component the command is related. Let's do the former, but this is how the latter would look like.

```bash
odo <COMMAND> --component frontend
```

Now to set your active component, do:

```execute-1
odo component set frontend
```

And verify that actually it was properly set:

```execute-1
odo list
```