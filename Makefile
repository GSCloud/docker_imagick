all: info

info:
	@echo "\e[1;32m👾 Welcome to Docker Imagick 👾\n"

	@echo "🆘 \e[0;1mmake build\e[0m - rebuild image"
	@echo "🆘 \e[0;1mmake docs\e[0m - rebuild documentation"
	@echo "🆘 \e[0;1mmake test\e[0m - test image"

docs:
	@echo "\n🔨 \e[1;32m Building documentation\e[0m"
	@/bin/bash ./create_pdf.sh

build:
	@echo "\n🔨 \e[1;32m Building Docker image\e[0m"
	@/bin/bash ./build.sh

test:
	@echo "\n🔨 \e[1;32m Testing Docker image\e[0m"
	@/bin/bash ./test.sh

push:
	@echo "\n🔨 \e[1;32m Pushing image to DockerHub\e[0m"
	@docker push gscloudcz/imagick:latest

everything: docs build test
