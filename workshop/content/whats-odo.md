OpenShift Do (`odo`) is a CLI tool for developers who are writing, building, and deploying applications on OpenShift. With `odo`, developers get an opinionated CLI tool that supports fast, iterative development. `odo` abstracts away Kubernetes and OpenShift concepts so developers can focus on what's most important to them: __code__.

`odo` was created to improve the developer experience with OpenShift. Existing tools such as `oc` are more operations-focused and require a deep understanding of Kubernetes and OpenShift concepts. `odo` is designed to be __simple__ and __concise__ so you can focus on coding rather than how to deploy your application. Since `odo` can build and deploy your code to your cluster immediately after you save your changes, you benefit from instant feedback and can validate your changes in real-time. `odo`'s syntax and design is centered around concepts already familiar to developers, such as project, application, and component.

## Features

- Designed for fast, iterative development cycles
- 100% client based. No server required within your OpenShift cluster for deployment
- Supports multiple languages and frameworks such as Node.js, Java, Ruby, Perl, PHP and Python
- Detect changes to your local code and deploy automatically with `odo watch`
- List all available components and services from your OpenShift cluster

## Glossary
In odo there are some terms that people often times use for different purposes. That's why we need to define them here for common understanding moving forward:

- __Component__: A constituent part of an application that will be where your business logic will reside, such as user-facing front ends or server-side backends. A component will have different attributes like storage, configuration, urls, etc. Multiple component types are currently supported, like nodejs, perl, php, python, ruby, etc.
- __Service__: A service will typically be a database or a "service" a component links to / depends on, but that has no business logic in it. For example: MariaDB, Jenkins, MySQL. These come from the OpenShift "Service Catalog" that has to be enabled within your cluster.
- __Application__: Is, well, your application! An application serves as a loose grouping concept to group the components and services together. A complex application, for example, may consist of multiple components and services working collaboratively providing you the full business value.
