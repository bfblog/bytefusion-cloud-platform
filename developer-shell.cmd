docker run -ti --volume %~dp0:/workspace --volume %USERPROFILE%\.kube:/root/.kube --volume //var/run/docker.sock:/var/run/docker.sock bfblog/dev-shell