
run:
	docker run -it --rm -v ~/.WolframEngine/Licensing:/home/wolframengine/.WolframEngine/Licensing ghcr.io/massimo-nocentini/wolframengine.docker:master

linux:
	docker run -it --rm -p 8081:8080 -e WOLFRAM_PORT=8080 -v ~/.WolframEngine/Licensing:/home/wolframengine/.WolframEngine/Licensing ghcr.io/massimo-nocentini/wolframengine.docker:wstpkernel

build:
	docker build -t ghcr.io/massimo-nocentini/wolframengine.docker:14.3 .

macos:
	docker run -it --rm -p 8081:8080 -v /Users/mn/Library/WolframEngine/Licensing:/home/wolframengine/.WolframEngine/Licensing ghcr.io/massimo-nocentini/wolframengine.docker:wstpkernel

hand-build:
	docker run -it -v $(pwd):/home debian:latest
	# the following should be run inside the container, after copying the files to the container
	# $ apt-get update && apt-get upgrade -y && apt-get install -y build-essential ca-certificates