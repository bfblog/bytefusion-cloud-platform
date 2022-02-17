SET SCRIPT_DIR=%~dp0

REM install nginx ingress controller
kubectl.exe apply -f https://raw.githubusercontent.com/bfblog/bytefusion-cloud-platform/main/third-party/ingress-nginx/v1.1.1/install.yaml
kubectl.exe wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=120s

REM install cert-manager
kubectl.exe apply --validate=false -f https://raw.githubusercontent.com/bfblog/bytefusion-cloud-platform/main/third-party/cert-manager/v1.7.1/release.yaml

REM install argocd
kubectl.exe apply -n argocd -f %SCRIPT_DIR%\kubernetes\docker-desktop\ --recursive=true
kubectl.exe apply -n argocd -f https://raw.githubusercontent.com/bfblog/bytefusion-cloud-platform/main/third-party/argocd/v2.2.5/install.yaml

REM show argocd-password
kubectl.exe -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d