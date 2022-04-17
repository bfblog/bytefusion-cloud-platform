SET SCRIPT_DIR=%~dp0
SET ROOT_DIR=%SCRIPT_DIR%\..

SET VERSION=v0.31.0
SET TEKTON_DASHBOARD_VERSION=v0.23.0
SET TEKTON_TRIGGERS_VERSION=v0.19.1

mkdir %ROOT_DIR%\third-party\tekton\%VERSION%
curl.exe -L https://storage.googleapis.com/tekton-releases/pipeline/previous/%VERSION%/release.yaml --output %ROOT_DIR%/third-party/tekton/%VERSION%/release.yaml

mkdir %ROOT_DIR%\third-party\tekton-dashboard\%TEKTON_DASHBOARD_VERSION%
         https://github.com/tektoncd/dashboard/releases/download/%TEKTON_DASHBOARD_VERSION%/tekton-dashboard-release.yaml
curl.exe -L https://github.com/tektoncd/dashboard/releases/download/%TEKTON_DASHBOARD_VERSION%/tekton-dashboard-release.yaml --output %ROOT_DIR%\third-party\tekton-dashboard\%TEKTON_DASHBOARD_VERSION%\tekton-dashboard-release.yaml

mkdir %ROOT_DIR%\third-party\tekton-triggers\%TEKTON_TRIGGERS_VERSION%
curl.exe -L https://storage.googleapis.com/tekton-releases/triggers/previous/%TEKTON_TRIGGERS_VERSION%/release.yaml --output %ROOT_DIR%\third-party\tekton-triggers\%TEKTON_TRIGGERS_VERSION%\release.yaml
curl.exe -L https://storage.googleapis.com/tekton-releases/triggers/previous/%TEKTON_TRIGGERS_VERSION%/interceptors.yaml --output %ROOT_DIR%\third-party\tekton-triggers\%TEKTON_TRIGGERS_VERSION%\interceptors.yaml