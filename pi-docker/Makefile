SCRIPT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY: help
.DEFAULT_GOAL=help
help:  ## help for this Makefile
	@grep -E '^[a-zA-Z0-9_\-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

IMAGE := pi-agent
APP := pi-sandbox

VERBOSE_OPT := --no-cache --progress=plain

.PHONY: build
build:  ## build docker image
	docker build -t $(IMAGE):latest -f Dockerfile.pi . 

.PHONY: build-verbose
build-verbose:  ## build docker image with verbose messages
	docker build -t $(IMAGE):latest -f Dockerfile.pi $(VERBOSE_OPT) . 

.PHONY: run 
run: build  ## run docker container
	@test -n "$(wk)" || ( echo "wk is not set"; exit 1 )
	@test -d "$(wk)" || ( echo "$(wk) is not a valid directory"; exit 1 )
	@test -n "$(DEEPSEEK_API_KEY)" || ( echo "DEEPSEEK_API_KEY is not set"; exit 1 )
	docker run --rm -it --name $(APP) \
		-e DEEPSEEK_API_KEY=$$DEEPSEEK_API_KEY \
		-v "$(wk):/workspace" $(IMAGE):latest

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
	
.PHONY: build-clean
build-clean:  ## run all steps without stoping to run server
	@$(MAKE) --no-print-directory -s build
	docker run --name $(APP) $(IMAGE):latest find .
	@$(MAKE) --no-print-directory -s rm
	@$(MAKE) --no-print-directory -s rmi
