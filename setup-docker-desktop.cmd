SET SCRIPT_DIR=%~dp0
SET ENV_DIR=%SCRIPT_DIR%\environments\docker-desktop

REM ingress-controller NGINX
kubectl.exe apply -f %ENV_DIR%\kubernetes\ingress-nginx\ingress-nginx-namespace.yml
kubectl.exe apply -f %ENV_DIR%\kubernetes\ingress-nginx\
kubectl.exe wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=300s

REM ArgoCD 
kubectl.exe apply -f %ENV_DIR%\kubernetes\default\argocd
kubectl.exe apply -f %ENV_DIR%\kubernetes\argocd-namespace.yaml
kubectl.exe apply -f %ENV_DIR%\kubernetes\argocd\

REM end of file