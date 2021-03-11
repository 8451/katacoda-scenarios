---

## Deployments (again)

---

Kubernetes is going to always try to maintain the "desired state" provided by the user to the system.

---

Let's delete a single pod and see what happens.

Deleting a pod will take some time to delete, so please be patient. 

`kubectl delete pod $(kubectl get pod --selector="user"="a123456" -o jsonpath={.items[0]..metadata.name})`{{execute}}

> _"pod "a123456-hello-xxxx-xxxx" deleted"_


---

Now let's see re-list all resources that have the label "user=a123456". 

`kubectl get all -l user=a123456`{{execute}}


Notice that the new pod name is different from the one deleted.  This is because Kubernetes didn't resurrect the old pod but instead stood up a new replacement pod.

---

Now let's delete the deployment (allow up to 5 minutes). 


`kubectl delete -f hello-deploy.yaml`{{execute}}
-OR-
`kubectl delete deploy -l user=a123456`{{execute}}

> _"deployment.apps "a123456-hello" deleted"_


And we can watch the progress of what is happening to the resources.

`watch kubectl get all -l user=a123456`{{execute}}


CTRL+c to stop watching the progress

`^C`{{execute ctrl-seq}}

---

Lastly, run the command again and see what happens. After a few moments (allow up to 5 minutes), all Pods tied to the Deployment will be deleted.


`kubectl get all -l user=a123456`{{execute}}

> _"No resources found"_

---

## That's all for this lab!!!

