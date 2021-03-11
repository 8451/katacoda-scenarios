---

## Config Map

---

A ConfigMap is an API object used to store non-confidential data in key-value pairs.  Pods can consume ConfigMaps as environment variables, command-line arguments, or as configuration files in a volume.

A ConfigMap allows you to decouple environment-specific configuration from your container images, so that your applications are easily portable and reusable.

![ConfigMap](./assets/kubernetes-configmap.png)

---

## Deploying a ConfigMap

Display the contents of nginx-cm.yaml to see what's inside.

`cat nginx-cm.yaml; echo;echo`{{execute}}

Deploy the ConfigMap.

`kubectl apply -f nginx-cm.yaml`{{execute}}
> _"configmap/nginx-index-a123456 created"_

---

## Referencing the ConfigMap

Review the contents of the yaml spec that will use the ConfigMap.

`cat hello-web-deploy-svc.yaml; echo;echo`{{execute}}

Let's apply the YAML and wait for it to be available.

`kubectl apply -f hello-web-deploy-svc.yaml; kubectl -n default wait deploy/hello-web-a123456 --for=condition=available --timeout=120s`{{execute}}
> _"deployment.apps/hello-web-a123456 condition met"_

---

## Confirm the ConfigMap was loaded

Now let's test to confirm whether the ConfigMap data is being used by nginx.

`kubectl run -n default -i --rm --restart=Never curl-test --generator=run-pod/v1 --image=radial/busyboxplus:curl -- sh -c "curl -vvv hello-service-a123456.default.svc.cluster.local"`{{execute}}
> _"Hello User!"_

