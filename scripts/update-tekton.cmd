SET SCRIPT_DIR=%~dp0
SET ROOT_DIR=%SCRIPT_DIR%\..

SET VERSION=v0.31.0
SET TEKTON_DASHBOARD_VERSION=v0.23.0

mkdir %ROOT_DIR%\third-party\tekton\%VERSION%
curl.exe -L https://storage.googleapis.com/tekton-releases/pipeline/previous/%VERSION%/release.yaml --output %ROOT_DIR%/third-party/tekton/%VERSION%/release.yaml

mkdir %ROOT_DIR%\third-party\tekton-dashboard\%TEKTON_DASHBOARD_VERSION%
         https://github.com/tektoncd/dashboard/releases/download/v0.23.0/tekton-dashboard-release.yaml
curl.exe -L https://github.com/tektoncd/dashboard/releases/download/%TEKTON_DASHBOARD_VERSION%/tekton-dashboard-release.yaml --output %ROOT_DIR%\third-party\tekton-dashboard\%TEKTON_DASHBOARD_VERSION%\tekton-dashboard-release.yaml

#kubectl.exe apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml
#kubectl.exe apply --filename https://github.com/tektoncd/dashboard/releases/latest/download/tekton-dashboard-release.yaml
#kubectl.exe apply --filename %SCRIPT_DIR%\kubernetestekton-pipelines/tekton-dashboard-ingress.yaml

