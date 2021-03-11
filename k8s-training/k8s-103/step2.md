---

## Deployments and Services

---

In order for the Pods within Kubernetes to communicate with each other, they must be bound to a **Service**.  The beauty of Services in Kubernetes is that it provides automatic / dynamic load balancing.  As Pods die and are redeployed, the Service that the application is bound to will route the traffic to the appropriate Pods as they become available.  There is no need to manually go in and tell Kubernetes which Pods to route traffic to.


There are several different types of services in Kubernetes.  The default one, and the one we will be using in this path, is ClusterIP.  A service of type: ClusterIP gives an application an IP that is accessible from within the Kubernetes Cluster and a DNS entry that is accessible within the cluster.

---

## Create a deployment

Let's review the file called hello-web-deploy.yaml.

`cat hello-web-deploy.yaml; echo;echo`{{execute}}


Now apply it to the cluster and wait for it to be ready.

`kubectl apply -f hello-web-deploy.yaml; kubectl -n default wait deploy/hello-web-a123456 --for=condition=available --timeout=120s`{{execute}}

> _"deployment.extensions/hello-web-a123456 created”_


---

## Validating a Service

Let's review the file called hello-web-svc.yaml.

`cat hello-web-svc.yaml`{{execute}}


Now apply it to the the cluster.

`kubectl apply -f hello-web-svc.yaml`{{execute}}

> _“service/hello-web-service-a123456 created”_

---

## Validate the Service

Lastly, run the below command to list deployments, services, pods, and endpoints with the label 'user=a123456' (with some detail using '-o wide'). 

`kubectl get deploy,svc,po,ep -l user=a123456 -o wide`{{execute}}


---

## Note

Observe that the service endpoints map to the running Pod IPs and the desired service port.

Also, we did not specify a 'Type' for our Service in the yaml file.  Kubernetes automatically defaults to assigning it a Type of 'ClusterIP' and gave it a cluster internal IP address over the port that we declared.  
