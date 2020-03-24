With both components of our application running on the cluster, we need to connect them so they can communicate.

You should already be in the directory for the frontend project which provides the context for link. As the frontend will initiate connections to the backend, we link the backend (and the details of its component) to the frontend:

```execute-1
odo link backend --port 8080
```

This will inject configuration about the backend component into the frontend  and restart the frontend. You'll see output similar to the following:

```bash
✓  Component backend has been successfully linked to the component frontend

The below secret environment variables were added to the 'frontend' component:

· COMPONENT_BACKEND_HOST
· COMPONENT_BACKEND_PORT

You can now access the environment variables from within the component pod, for example:
$COMPONENT_BACKEND_HOST is now available as a variable within component frontend
```

After creating a new link, odo will automatically restart the frontend component to pick up the new environment variables. Once again, you can follow the logs to see when the frontend has started:

```execute-1
odo log -f
```

__NOTE__: The log tail may close when the application is restarted. If that happens before you see the message below, simply restart the log using the command above.

Similar to before, you can expect to see something similar to the following when the frontend has been successfully redeployed:

```
Listening on port 8080
```

Run the following to stop tailing the logs:

```execute-1
<ctrl+c>
```

Once the component has successfully been re-deployed you can return to the concessions site and submit an order:

http://frontend-8080-concessions-%project_namespace%.%cluster_subdomain%/

When you press the "Place Order" button, you'll get a confirmation page that displays the ticket number and a summary of the order.