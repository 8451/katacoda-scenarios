---

## Overview of Secrets 

---

Kubernetes Secrets let you store and manage sensitive information, such as passwords, OAuth tokens, and ssh keys. Storing confidential information in a Secret is safer and more flexible than putting it verbatim in a Pod definition or in a container image. See Secrets design document for more information.

A Secret is an object that contains a small amount of sensitive data such as a password, a token, or a key. Such information might otherwise be put in a Pod specification or in an image. Users can create Secrets and the system also creates some Secrets.

![Kubernetes Secrets Diagram](./assets/k8s-secrets.png)

---

## Encoding Secrets

By default, Kubernetes requires data stored in Secrets to be base64 encoded (you can use the base64 command to do so).

Let's base64 encrypt some strings.

`echo -n 'admin' | base64`{{execute}}
> _"YWRtaW4="_

`echo -n 'password' | base64`{{execute}}
> _"cGFzc3dvcmQ="_


For convenience, these values have already been loaded into the secrets YAML file we will be using.

Reivew the YAML to confirm.

`cat tomcat-secrets.yaml; echo;echo`{{execute}}

---

## Deploying the Secrets

Now let's create the Secret.

`kubectl apply -f tomcat-secrets.yaml`{{execute}}
> _"secret/tomcat-user-a123456 created"_

> _"secret/tomcat-pass-a123456 created"_
