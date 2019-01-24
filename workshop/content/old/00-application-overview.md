---
Title: Application overview
PrevPage: index
NextPage: 01-creating-an-application
---

In this course you will get a __deep__ introduction to the tool ``odo``. This tool provides a simplified command line client for deploying applications to OpenShift. The application you will be deploying is a wild west shooter style game.

Applications are often divided into components based on a logical division of labor. For example, an application might consist of a data-storage "backend" component that performs the application's primary work and permanently stores the results, paired with a user interface "frontend" component that accesses the backend to retrieve data and display it to a user.

__TODO__: Rewrite this?

The application deployed in this lesson consists of two such components.

The backend is a Java based Spring Boot application. It performs queries against the Kubernetes REST API to obtain a list of the resource objects that were created when you deploy the application, delivering up details about these resource objects to the frontend.

The frontend is written in Node.js. It displays imagery for a wild west town and displays popup images which you can shoot, corresponding to the resource objects provided by the backend.
