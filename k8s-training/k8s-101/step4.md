---

## Labels

---

Labels are key/value pairs that are attached to objects, such as namespaces or pods.  Labels can be used to organize, identify, describe and group together related sets of objects or resources.  Labels can be attached to objects at creation time and subsequently added and modified at any time.

---

## Label creation

Let's create some more namespaces.

```
kubectl create ns ns1
kubectl create ns ns2
kubectl create ns ns3
```{{execute}}
> _“namespace/ns# created”_

Let's add some labels to various namespaces.

```
kubectl label ns ns1 createdby=user purpose=testing
kubectl label ns ns2 createdby=user purpose=testing
kubectl label ns ns3 createdby=user purpose=testing
kubectl label ns kube-system createdby=cluster purpose=mgmt
kubectl label ns kube-node-lease createdby=cluster purpose=mgmt
kubectl label ns kube-public createdby=cluster purpose=services
```{{execute}}
> _"namespace/xxxx labeled"_


Let's confirm the Labels are now present.

`kubectl get ns --show-labels`{{execute}}

---

## Use Labels to list specific resources

Let's display only the Namespaces which have the createdby=user label present.

`kubectl get ns -l createdby=user --show-labels`{{execute}}


Now display only the Namespaces which have Labels createdby=cluster and purpose=mgmt present.

`kubectl get ns -l createdby=cluster,purpose=mgmt --show-labels`{{execute}}

---

## That's all for this lab!!!

