BUILDER_IMAGE=latex-builder-image

DOCKER_OPTIONS=-v $(shell pwd):/workdir --rm

RESOURCES=slides/resources

define run_docker
        $(V)docker run -ti $(DOCKER_OPTIONS) \
	$(2) \
        $(BUILDER_IMAGE) \
        $(1)
endef

all: slides

.PHONY:
$(BUILDER_IMAGE):
	docker build . -t $@ --build-arg USER_ID=$(shell id -u)

slides: $(BUILDER_IMAGE)
	$(call run_docker,make -C slides)

docker-shell: $(BUILDER_IMAGE)
	$(call run_docker,/bin/bash)


install-pod:
	kubectl apply -f $(RESOURCES)/deployment-with-resources.yaml
	kubectl apply -f $(RESOURCES)/service-hpa.yaml

install-ingress:
	kubectl apply -f $(RESOURCES)/ingress.yaml

install-hpa:
	kubectl apply -f $(RESOURCES)/horizontal-pod-autoscaler.yaml

install-locust:
	helm upgrade locust helm/locust --install --namespace locust \
	--set worker.replicaCount=2 \
	--set master.config.target-host="http://my-service.default" \
	--set worker.config.locust-script=/locust-tasks/getroot.py

delete-locust:
	helm delete --purge locust
