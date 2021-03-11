---

## Referencing Secrets

---


Now let's define an Apache tomcat deployment that will utilize the secrets we just created.

Take a look at the contents of tomcat-deploy-svc.yaml we will be deploying.

`cat tomcat-deploy-svc.yaml; echo;echo`{{execute}}


Now, apply the Deployment and the Service and wait for it to be available:

`kubectl apply -f tomcat-deploy-svc.yaml; kubectl -n default wait deploy/tomcat-a123456 --for=condition=available --timeout=120s`{{execute}}
> _"deployment.apps/tomcat-a123456 condition met"_
