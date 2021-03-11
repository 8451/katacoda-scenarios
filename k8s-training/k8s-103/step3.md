---

## Service Interworkings

---

Now that we have a web server running and a service bound to it, we are able to access it from within the Kubernetes cluster.  We can test this by deploying a new Pod in the cluster that uses the curl command to communicate via DNS entry for the service.

---

Let's re-run the command to list the details of our deployed resources by label.

`kubectl get deploy,svc,po,ep -o wide -l user=a123456`{{execute}}

---

Now we will delete a single pod.

Deleting a pod will take some time to delete, so please be patient. 

`kubectl delete pod $(kubectl get pod --selector="user"="a123456" -o jsonpath={.items[0]..metadata.name})`{{execute}}

> _"pod "hello-web-a123456-xxxx-xxxx" deleted"_

---

Once again, let's run the command after the pod is deleted.

`kubectl get deploy,svc,po,ep -o wide -l user=a123456`{{execute}}

---

## Note

Did you pick up on the following...
- a new Pod was spun up to replace the deleted one
- the Pod was assigned a new IP
- the Service End Points were updated to include the new pod details

