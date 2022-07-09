#@author Fred Brooker <git@gscloud.cz>
all: info
include .env

info:
	@echo "\e[1;32m👾 Welcome to ${APP_NAME}"
	@echo ""
	@echo "🆘 \e[0;1mmake build\e[0m - build image"
	@echo "🆘 \e[0;1mmake docs\e[0m - build documentation"
	@echo "🆘 \e[0;1mmake test\e[0m - test image"

docs:
	@/bin/bash ./bin/create_pdf.sh

build:
	@/bin/bash ./bin/build.sh

test:
	@/bin/bash ./bin/test.sh

push:
	@docker push ${TAG}

everything: docs build test
