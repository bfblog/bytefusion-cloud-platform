# Variables
HELM_CHART_INGRESS_NGINX=4.9.0
MAKEFILE_DIR=$(dir $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: all environments

all: environments

clean:
	rm -rf ./third-party/ingress-nginx

environments: environments/docker-desktop/kubernetes/ingress-nginx

third-party/ingress-nginx:
	helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
	helm repo update
	helm pull ingress-nginx/ingress-nginx --version $(HELM_CHART_INGRESS_NGINX) --untar --untardir ./third-party

environments/docker-desktop/kubernetes/ingress-nginx: third-party/ingress-nginx
	# generating ingress-nginx manifests for docker-desktop
	@mkdir -p ./tmp
	@rm -rf environments/docker-desktop/kubernetes/ingress-nginx/*.yaml 
	mkdir -p ./environments/docker-desktop/kubernetes/ingress-nginx
	# apply helm template to generate manifests
	helm template ingress-nginx ./third-party/ingress-nginx --version $(HELM_CHART_INGRESS_NGINX) --namespace ingress-nginx --values ./environments/docker-desktop/charts/ingress-nginx/values.yaml > ./tmp/ingress-nginx.yaml
	# yq to split single file into multiple files, use kind and name as filename
	yq -s '"environments/docker-desktop/kubernetes/ingress-nginx/" + (.kind | downcase) + "-" + (.metadata.name | downcase) + ".yaml"' ./tmp/ingress-nginx.yaml  



