REPO="danyelmorales/centos-java"
NAMED="centos_java_dan"

.PHONY: all

all:
	make build

.PHONY: build
build:
	docker build -t $(REPO) .

.PHONY: nocache
nocache:
	docker build -t $(REPO) --no-cache .
.PHONY: push
push:
	docker push $(REPO)

.PHONY: run
run:
	docker run --name $(NAMED) ${built}
