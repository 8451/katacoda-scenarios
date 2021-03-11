---

## Kubernetes CLI - kubectl

---


The primary CLI for interacting with Kubernetes is kubectl.


## kubectl warm up

Let's check to make sure the kubectl cli is available and operational.

`kubectl version`{{execute}}

`kubectl cluster-info`{{execute}}


Also it is good proactice to make sure kubectl is pointing to the desired cluster / context before running commands.

`kubectl config view --minify`{{execute}}

`kubectl config current-context`{{execute}}


---

## kubectl plugins via krew

Let's install a kubectl plugin manager called krew.

```
(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew.tar.gz" &&
  tar zxvf krew.tar.gz &&
  KREW=./krew-"${OS}_${ARCH}" &&
  "$KREW" install krew
)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
```{{execute}}

> _"Installed plugin: krew"_


Let's install some kubectl plugins.

`kubectl krew install whoami ctx ns`{{execute}}


---

## kubectl plugin example


Now, run a kubectl command using one of the plugins

`kubectl whoami; echo`{{execute}}

> _"kubecfg:basicauth:admin"_

