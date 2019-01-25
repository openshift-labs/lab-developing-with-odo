---
Title: Exposing components to public
PrevPage: 081-change-active-component
NextPage: 091-linking-application-components
---

Let's create an external URL for our frontend component so we can see it in action:

```execute-1
odo url create frontend
```

This time, we will get an error, because this component exposes 3 ports and we need to be explicit about which one we want to expose.

```execute-1
odo url create frontend --port 8080
```

The URL created for the application will be displayed. Visit the URL in your web browser to view the application.

http://frontend-parksmap-%project_namespace%.%cluster_subdomain%
