---
Title: Exposing components to public
PrevPage: 060-creating-new-binary-component
NextPage: 070-deploying-component-from-source-code
---

We have deployed our sample application's frontend component. Let's create an external URL for our application so we can see it in action:

```execute-1
odo url create frontend
```

You should see similar output to this:

```bash
✗  port for the component frontend is required as it exposes 3 ports: 8080,8443,8778
```

Since this component exposes 3 different ports, we need to explicitly define which one is the one we want for our external access:

```execute-1
odo url create frontend --port 8080
```

The URL created for the application will be displayed. Visit the URL in your web browser to view the application.

http://frontend-parksmap-%project_namespace%.%cluster_subdomain%

__NOTE__: When you don't specify a name for the URL to be created, it will default to the name of the component and port, e.g. ``http://frontend-8080-parksmap-%project_namespace%.%cluster_subdomain%``
