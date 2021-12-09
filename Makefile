RESOURCES=slides/resources


all:
	docker-compose run build

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
