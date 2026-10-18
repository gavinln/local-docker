SCRIPT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY: help
.DEFAULT_GOAL=help
help:  ## help for this Makefile
	@grep -E '^[a-zA-Z0-9_\-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

IMAGE := my-flask-app
APP := my-app

.PHONY: build
build:  ## build docker image
	docker build -t $(IMAGE):latest . 

.PHONY: build-verbose
build-verbose:  ## build docker image with verbose messages
	docker build --no-cache --progress=plain -t my-flask-app:latest . 

.PHONY: run 
run:  ## run docker container
	docker run -p 5000:5000 --name $(APP) $(IMAGE):latest

.PHONY: stop
stop:  ## stop docker container
	docker stop $(APP)

.PHONY: rm
rm:  ## remove docker container
	docker rm $(APP)

.PHONY: rmi
rmi:  ## remove docker image
	docker rmi $(IMAGE):latest
	
.PHONY: stats
stats:  ## stats for docker container
	docker stats $(APP)
	
