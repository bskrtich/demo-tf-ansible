
.PHONY: default
default: help

.PHONY: help
help: ## this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: bootstrap
bootstrap: ## Install required packages and libraries
	sudo apt install -y ansible ansible-lint pylint python3-pip
	python3 -m pip install boto3
	ansible-galaxy install -r ansible/dependencies.yml
	cd terraform && terraform init

.PHONY: lint
lint: ## Validate coding standards
	find -iname '*.yml' -print0 | xargs -0 ansible-lint -v
	find -iname '*.py' -print0 | xargs -0 pylint -v
	cd terraform && terraform fmt
	cd terraform && terraform workspace select stage && terraform validate
	cd terraform && terraform workspace select prod && terraform validate


.PHONY: build
build:
	docker build -t demo-project ./src/


.PHONY: stage-infra
stage-infra: ## Build stage infrastructure with terraform
	@cd terraform && terraform workspace select stage && terraform apply

.PHONY: stage-setup
stage-setup: ## Configure stage host with ansible
	ansible-playbook -i ./inventory.sh ansible/setup.yml -l stage_demo

.PHONY: stage-deploy
stage-deploy: build ## Deploy demo service to stage
	ansible-playbook -i ./inventory.sh ansible/deploy.yml -l stage_demo
	@# TODO: deploy to stage - pull env from s3 and push to new instance

.PHONY: stage-destroy
stage-destroy: ## Destroy the stage infrastructure with terraform
	@cd terraform && terraform workspace select stage && terraform destroy


.PHONY: prod-infra
prod-infra: ## Build prod infrastructure with terraform
	@cd terraform && terraform workspace select prod && terraform apply

.PHONY: prod-setup
prod-setup: ## Configure prod host with ansible
	ansible-playbook -i ./inventory.sh ansible/setup.yml -l prod_demo

.PHONY: prod-deploy
prod-deploy: build ## Deploy demo service to prod
	ansible-playbook -i ./inventory.sh ansible/deploy.yml -l prod_demo

.PHONY: prod-destroy
prod-destroy: ## Destroy the production infrastructure with terraform
	@cd terraform && terraform workspace select prod && terraform destroy
