
run:
	docker run -it --rm -v ~/.WolframEngine/Licensing:/home/wolframengine/.WolframEngine/Licensing ghcr.io/massimo-nocentini/wolframengine.docker:master

linux:
	docker run -it --rm -p 8081:8080 -e WOLFRAM_PORT=8080 -v ~/.WolframEngine/Licensing:/home/wolframengine/.WolframEngine/Licensing ghcr.io/massimo-nocentini/wolframengine.docker:wstpkernel

build:
	docker build -t massimonocentini/wolframengine:wstpkernel .

macos:
	docker run -it --rm -p 8081:8080 -v /Users/mn/Library/WolframEngine/Licensing:/home/wolframengine/.WolframEngine/Licensing ghcr.io/massimo-nocentini/wolframengine.docker:wstpkernel


