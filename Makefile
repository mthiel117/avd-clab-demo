### Generic Variables
# SHELL := /bin/zsh
SHELL := /bin/bash

.PHONY: help
help: ## Display help message (*: main entry points / []: part of an entry point)
	@grep -E '^[0-9a-zA-Z_-]+\.*[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

################################################################################
# Start/Stop ContainerLab
################################################################################
.PHONY: start-lab
start-lab: ## Start Containerlab
	sudo clab deploy -t clab/clab-L2LS-topo.yml --reconfigure

.PHONY: stop-lab
stop-lab: ## Stop ContainerLab
	sudo clab destroy -t clab/clab-L2LS-topo.yml --cleanup

.PHONY: build
build: ## Build Configs
	ansible-playbook playbooks/build.yml

.PHONY: deploy
deploy: ## deploy Configs via eAPI
	ansible-playbook playbooks/deploy.yml
