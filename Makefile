BUILDER_IMAGE = latex-builder-image

DOCKER_OPTIONS = -v $(shell pwd):/workdir --rm

define run_docker
        $(V)docker run -ti $(DOCKER_OPTIONS) \
	$(2) \
        $(BUILDER_IMAGE) \
        $(1)
endef

.PHONY:
$(BUILDER_IMAGE):
	docker build . -t $@ --build-arg USER_ID=$(shell id -u)

slides: $(BUILDER_IMAGE)
	$(call run_docker,make -C slides)

docker-shell: $(BUILDER_IMAGE)
	$(call run_docker,/bin/bash)
