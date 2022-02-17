SET SCRIPT_DIR=%~dp0
SET ROOT_DIR=%SCRIPT_DIR%\..

SET VERSION=v2.4.0

mkdir %ROOT_DIR%\third-party\kubernetes-dashboard\%VERSION%
curl.exe -L https://raw.githubusercontent.com/kubernetes/dashboard/%VERSION%/aio/deploy/recommended.yaml --output %ROOT_DIR%/third-party/kubernetes-dashboard/%VERSION%/release.yaml

