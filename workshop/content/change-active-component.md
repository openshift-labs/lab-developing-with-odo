Now that our backend is fully functional, we need to connect to it from our `frontend` so they can communicate.

As we're going to execute some actions with the `frontend` component, we need to set it as our active component.

The current, or active, component is defined by the directory you're in with your shell, just as in *Git*.

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

The active component is the `backend`. You can either take one of two paths, change to the directory for your component and execute the `in-context` actions on it or we can specify to any command to which component the command is related. Let's do the former, but this is how the latter would look like.

```bash
odo <COMMAND> --component frontend
```

Now to set the `frontend` as your active component, run the following:

```execute-1
cd ~/frontend
```

And verify that actually it was properly set:

```execute-1
odo list
```

You should see the following if `frontend` is your active component:

```
ACTIVE     NAME         TYPE
           backend      nodejs
*          frontend     java
```
