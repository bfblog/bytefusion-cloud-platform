# bytefusion data platform

The bytefusion data platform implements a container environment with frequently used basic functions. The platform creates a unified operating environment for applications and provides them with cross-cutting functions. The installation is done with a few steps and is even executable on a Docker Desktop based Kubernetes.

The most important feature is the ease of installation with optional installable modules. In the first steps, a boot loader is installed in the cluster. The boot loader sets up the business logic for reloading additional components. In the second step, the list of additional components is loaded from the GIT repository.  The list defines the target specifications for the software to be set up. In a continuous alignment, the actual state is adjusted to the target specifications. 

* https://argocd.127.0.0.1.nip.io => ArgoCD frontent
* http://kubernetes-dashboard.127.0.0.1.nip.io => kubernetes-dashboard
* https://tekton-dashboard.127.0.0.1.nip.io => tekton dashboard
* cert-manager
* ingress-nginx
* k8s metrics-server
* in work: opensearch logging stack

[release notes](./RELEASE-NOTES.md)

# prerequisite

* windows workstation
* docker desktop with kubernetes

Note: Operation on other operating systems is possible, but not tested so far.

# setup

1. Execute script **setup-docker-desktop.cmd** to install bootstrap software. The script installs ArgoCD with an Ingress. Loading the containers can take several minutes. After successful execution, the ArgoCD passowrt is printed in the console. In the browser, ArgoCD is now accessible under the url argocd.127.0.0.1.nip.io.
<br>
Note: The service nip.io allows DNS-lookups to localhost. In this way, modification to hosts (windows: windows/system32/drivers/etc/hosts, linux: /etc/hosts) is not required. 
2. ArgoCD builds the bootstrap loader and checks GIT repository for further components. The default profile configures the additional components.




```
> wsl -d docker-desktop
> sysctl -w vm.max_map_count=262144
```

