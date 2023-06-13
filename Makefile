.PHONY: all plan apply destroy

all: help init-modules pre-commit

help: ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

init-modules:
	@terraform -chdir=examples/foundation-all/ init -upgrade && \
	terraform -chdir=examples/foundation-common/ init -upgrade  && \
	terraform -chdir=examples/foundation-stack/ init -upgrade

pre-commit: init-modules
	@pre-commit run -a
