TAG?=test
DOCKER_REPO?=jtilander
DC=docker-compose

.PHONY: iterate clean all kill build log up image push

iterate: kill build up log

build:
	$(DC) build

kill:
	$(DC) stop && $(DC) rm -f

up:
	$(DC) up -d

log:
	$(DC) logs -f

image:
	docker build -t $(DOCKER_REPO)/docker-pypi:$(TAG) .

push:
	docker push $(DOCKER_REPO)/docker-pypi:$(TAG)
