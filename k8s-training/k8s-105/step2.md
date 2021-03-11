---

## Overview of Secrets 

---

Kubernetes Secrets let you store and manage sensitive information, such as passwords, certificates, tokens, or keys.  Storing confidential information in a Secret is safer and more flexible than putting it verbatim in a Pod definition or in a container image.

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
