-include /opt/basics/common/common.mk

.PHONY: compose-setup compose compose-bash compose-build compose-test compose-code-lint \
	code-lint compose-description-lint compose-schema-validate ci-check release

compose-setup: compose-build

compose:
	docker compose up

compose-bash:
	docker compose run exercises bash

compose-build:
	docker compose build

compose-test:
	docker compose run exercises make test

compose-code-lint:
	docker compose run exercises make code-lint

code-lint:
	@set -eu; \
	found=0; \
	for i in $$(find modules -type f -name Makefile | sort); do \
		dir=$$(dirname "$$i"); \
		found=1; \
		echo "check $$dir"; \
		PATH="$(CURDIR)/bin:$$PATH" $(MAKE) -C "$$dir" test; \
	done; \
	if [ "$$found" -eq 0 ]; then \
		echo "No module Makefiles found" >&2; \
		exit 1; \
	fi

compose-description-lint:
	docker compose run exercises make description-lint

compose-schema-validate:
	docker compose run exercises make schema-validate

ci-check:
	docker compose --file docker-compose.yml build
	docker compose --file docker-compose.yml up --abort-on-container-exit

release:
	git push -f origin main:release
