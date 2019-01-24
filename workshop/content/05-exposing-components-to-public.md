---
Title: Exposing components to public
PrevPage: 04-linking-application-components
NextPage: 06-making-changes-to-source-code
---

We have deployed our sample application's backend component and connected the frontend component to it. Let's create an external URL for our application so we can see it in action:

```execute-1
odo url create frontend
```

The URL created for the application will be displayed. Visit the URL in your web browser to view the application.

http://frontend-wildwest-%user_namespace%.%cluster_subdomain%
