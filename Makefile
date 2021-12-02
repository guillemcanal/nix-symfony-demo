.DEFAULT_GOAL := help

vendor: composer.lock
	composer install || { touch composer.lock; exit 1; }
	touch vendor

node_modules: yarn.lock
	yarn install || { touch yarn.lock; exit 1; }
	touch node_modules

.PHONY: vendors
vendors: vendor node_modules

.PHONY: up
up: vendors ## Starts all services
	$(APP_SCRIPTS)/services up
	$(APP_SCRIPTS)/open http://localhost:$(NGINX_PORT)

.PHONY: down
down: ## Stops all services
	$(APP_SCRIPTS)/services down

.PHONY: clean
clean: down ## Remove artifacts (vendor, logs, cache, ...)
	rm -rf vendor node_modules /{cache,logs}/*

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'
