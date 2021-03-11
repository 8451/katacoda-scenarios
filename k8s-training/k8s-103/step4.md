---

## Service Interworkings

---

Now that we have a web server running and a service bound to it, we are able to access it from within the Kubernetes cluster.  We can test this by deploying a new Pod in the cluster that uses the curl command to communicate via DNS entry for the service.  Altough we cannot directly talk to our Service from outside the cluster, we will utilize a Kubernetes port-forward feature to bridge the communication and test our webapp with a browser.

---

## Run a Pod to test communication to our Service

`kubectl run -n default -i --restart=Never --rm curl-test --generator=run-pod/v1 --image=radial/busyboxplus:curl -- sh -c "curl -vvv hello-web-service-a123456.default.svc.cluster.local"`{{execute}}

> _"Welcome to nginx!"_

---

## Command Explanation of Deploying the Pod and Curling the Service from Within the Pod

| Item                            | Purpose                                                                                              |
|---------------------------------|------------------------------------------------------------------------------------------------------|
| -i                              | interactive, keeps STDIN (standard input) open even if not attached                                  |
| --restart=Never                 | creates a Pod by default if generator flag was not specified                                         |
| --rm                            | deletes resources created after executing                                                            |
| curl-test                       | name of the Pod to be spun up                                                                        |
| --generator=run-pod/v1          | generate resources based on a set of inputs and is used to pin a particular behavior                 |
| --image=radial/busyboxplus:curl | specify container image, a curl image was created as an alternate for those only needing to use curl |
| -- sh -c                        | execute a shell within the container and run the command following "-c"                              |


---

## Port Forwarding

Port Forward the nginx Pod to localhost:80

`kubectl port-forward $(kubectl get pod --selector="user"="a123456" -o jsonpath={.items[0]..metadata.name}) --address 0.0.0.0 8080:80`{{execute}}
> _"Forwarding from 0.0.0.0:8080 -> 80 Forwarding from [::1]:80 -> 80"_

Navigate to the **Dashboard** tab, to the right of the terminal tab and enter "8080" as the port number. Then select "Display Port" and a "Welcome to nginx" screen should appear. Note that if you delete your Podthen you will have to re-run the kubectl port-forward command to use the Dashboard.

Instead of the **Dashboard** tab you could also navigate to this page:
https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com

---

## Cleanup

Once finished, stop the port forward 

`^C`{{execute ctrl-seq}}


Lastly, remove the service and the deployment with the below command:
`kubectl delete svc,deploy -l user=a123456`{{execute}}

> _"deployment.apps "hello-web-a123456" deleted"_


## That's all for this lab!!!

