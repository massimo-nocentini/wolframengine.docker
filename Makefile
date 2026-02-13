
run:
	docker run -it --rm -v ~/.WolframEngine/Licensing:/home/wolframengine/.WolframEngine/Licensing ghcr.io/massimo-nocentini/wolframengine.docker:master

linux:
	docker run -it --rm -p 8081:8080 -e WOLFRAM_PORT=8080 -v ~/.WolframEngine/Licensing:/home/wolframengine/.WolframEngine/Licensing ghcr.io/massimo-nocentini/wolframengine.docker:wstpkernel

build:
	docker build -t ghcr.io/massimo-nocentini/wolframengine.docker:14.3 .

macos:
	docker run -it --rm -p 8081:8080 -v /Users/mn/Library/WolframEngine/Licensing:/home/wolframengine/.WolframEngine/Licensing ghcr.io/massimo-nocentini/wolframengine.docker:wstpkernel

hand-build:
	exit 0
	docker run -it --workdir /home/wolframengine -v $(pwd):/home/host --name hand-build-wolframengine-arm64 debian:latest
	# the following should be run inside the container, after copying the files to the container:
	$ apt-get update && apt-get upgrade -y && apt-get install -y build-essential ca-certificates
	$ apt-get install -y ../host/wolfram-engine_14.3.0+202510021899_arm64.deb
	$ cp -r /opt/Wolfram/WolframEngine/14.3/SystemFiles/Links/WSTP/DeveloperKit/Linux-ARM64/CompilerAdditions/ .
	docker commit hand-build-wolframengine-arm64 ghcr.io/massimo-nocentini/wolframengine.docker:14.3
	docker rm hand-build-wolframengine-arm64
	docker push ghcr.io/massimo-nocentini/wolframengine.docker:14.3