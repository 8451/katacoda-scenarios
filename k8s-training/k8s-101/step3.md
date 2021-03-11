---

## Working with Namespaces

---

Namespaces are a Kubernetes logical construct used for separating Kubernetes resources.  When using kubectl you can utilize the argument 'namespace' or the shorthand 'ns' to interact with namespaces.

---

## Namespace Basics


Let's see which namespace kubectl is configured to operate in using the "ns" krew plugin.

`kubectl ns -c`{{execute}}

> _“default”_

---

## Creating and Listing Namespaces

Let's use kubectl to create a new namespace.


`kubectl create ns sandbox`{{execute}}

> _“namespace/sandbox created”_


Execute the command below to list all namespaces in the cluster.

`kubectl get ns`{{execute}}

---

## Namespace scoping

When running commands you can either specify the namespace (in order of precedence):
- the YAML definition file of a resource being implemented
- the kubectl commandline using '-n NAMESPACE_NAME' or '--namespace NAMESPACE_NAME'
- automatically via the namespace in the context being used

Let's update our context to use the 'sandbox' namespace and see what resources are present.

`kubectl ns sandbox`{{execute}}
> _"Active namespace is "sandbox"."_

`kubectl get all`{{execute}}
> _"No resources found in sandbox namespace."_

Let's return our context to use the 'default' namespace.

`kubectl ns default`{{execute}}
> _"Active namespace is "default"."_

Let's see what is running under another namespace using the '-n' flag.

`kubectl get all -n kube-system`{{execute}}


