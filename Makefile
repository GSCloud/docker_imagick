all: info

info:
	@echo "\e[1;32m👾 Welcome to Imagick in Docker 👾"
	@echo "🆘 \e[0;1mmake build\e[0m - rebuild image"
	@echo "🆘 \e[0;1mmake docs\e[0m - rebuild documentation"
	@echo "🆘 \e[0;1mmake everything\e[0m - run all make points"
	@echo "🆘 \e[0;1mmake test\e[0m - test image"

docs:
	@/bin/bash ./create_pdf.sh

build:
	@/bin/bash ./build.sh

test:
	@/bin/bash ./test.sh

everything: docs build test
