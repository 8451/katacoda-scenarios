---

## ConfigMap Editing

---

One of the benefits of using a ConfigMap is that they allow you to update a Pod without having to modify the deployment or rebuild images and redeploy. So to change our index.html page, rather than editing the nginx deployment itself, we can edit the ConfigMap.

---

## Modify values in a ConfigMap

Backing up the original ConfigMap YAML and updating a value.

`cp -rp nginx-cm.yaml{,.bak}; sed -i 's/User/Everyone/' nginx-cm.yaml`{{execute}}

Confirm changes were made (should just be the last line).

`diff -W $(tput cols) --side-by-side  nginx-cm.yaml{.bak,}; echo;echo`{{execute}}

## Apply the updated ConfigMap

Now, apply the updated ConfigMap (and wait at least 4 minutes).

`kubectl apply -f nginx-cm.yaml; echo; printf "[*] wait for it... "; spin.sh sleep 240; echo;echo`{{execute}}
> _"configmap/nginx-index-a123456 configured"_

It will take a few minutes for the changes to be applied (so the command above waits that long).  Under the hood, nginx is monitoring the ConfigMap for changes.  If a change is applied to the ConfigMap, it will write the new index.html file.  All of this is done without a restart of the nginx Pod.

## Confirm the ConfigMap update took place

After waiting, use another pod to confirm the changes were applied.

`kubectl run -n default -i --rm --restart=Never curl-test --generator=run-pod/v1 --image=radial/busyboxplus:curl -- sh -c "curl -vvv hello-service-a123456.default.svc.cluster.local"`{{execute}}
> _"Hello Everyone!"_

---

## That's all for this lab!!!

