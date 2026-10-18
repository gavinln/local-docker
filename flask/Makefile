SCRIPT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY: help
.DEFAULT_GOAL=help
help:  ## help for this Makefile
	@grep -E '^[a-zA-Z0-9_\-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: build
build:  ## build docker image
	docker build -t my-flask-app:latest . 

.PHONY: build-verbose
build-verbose:  ## build docker image with verbose messages
	docker build --no-cache --progress=plain -t my-flask-app:latest . 

.PHONY: run 
run:  ## run docker container
	docker run -p 5000:5000 --name my-app my-flask-app:latest

.PHONY: stop
stop:  ## stop docker container
	docker stop my-app

.PHONY: rm
rm:  ## remove docker container
	docker rm my-app
	
.PHONY: stats
stats:  ## stats for docker container
	docker stats my-app
	
