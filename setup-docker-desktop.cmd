SET SCRIPT_DIR=%~dp0

REM install nginx ingress controller
kubectl.exe apply -f https://raw.githubusercontent.com/bfblog/bytefusion-cloud-platform/main/third-party/ingress-nginx/v1.1.1/install.yaml
kubectl.exe wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=120s

REM install cert-manager
REM kubectl.exe apply --validate=false -f https://raw.githubusercontent.com/bfblog/bytefusion-cloud-platform/main/third-party/cert-manager/v1.7.1/release.yaml

REM install argocd
kubectl.exe apply -n argocd -f https://raw.githubusercontent.com/bfblog/bytefusion-cloud-platform/main/third-party/argocd/v2.3.3/install.yaml
kubectl.exe apply -n argocd -f %SCRIPT_DIR%\environments\docker-desktop\kubernetes\ --recursive=true

kubectl.exe wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=120s
kubectl.exe wait --for=condition=Ready pod/argocd-application-controller-0 -n argocd --timeout=300s

REM show argocd-password
kubectl.exe -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d