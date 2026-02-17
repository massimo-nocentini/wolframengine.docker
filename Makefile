
run:
	docker run --user wolframengine -it --rm -v ./Licensing/mathpass:/opt/Wolfram/WolframEngine/14.3/Configuration/Licensing/mathpass ghcr.io/massimo-nocentini/wolframengine.docker:14.3
# 	docker run -it --rm -v ./Licensing:/home/wolframengine/.WolframEngine/Licensing wolframresearch/wolframengine:14.3

linux:
	docker run -it --rm -p 8081:8080 -e WOLFRAM_PORT=8080 -v ~/.WolframEngine/Licensing:/home/wolframengine/.WolframEngine/Licensing ghcr.io/massimo-nocentini/wolframengine.docker:wstpkernel

build:
	docker build --build-arg BUILDPLATFORM=linux/amd64 -t ghcr.io/massimo-nocentini/wolframengine.docker:14.3 .

macos:
	docker run -it --rm -p 8081:8080 -v /Users/mn/Library/WolframEngine/Licensing:/home/wolframengine/.WolframEngine/Licensing ghcr.io/massimo-nocentini/wolframengine.docker:wstpkernel

hand-build:
	exit 0
# 	docker run -it -v $(pwd):/home/host --name hand-build-wolframengine-arm64 ubuntu:latest
	docker run -it --name hand-build-wolframengine-arm64 ubuntu:latest
#--- 	the following should be run inside the container, after copying the files to the container:
	apt-get update && apt-get upgrade -y && apt-get install -y build-essential ca-certificates sudo wget libegl-dev
	useradd -m -s /bin/bash -p wolframengine wolframengine
# 	usermod -aG sudo wolframengine
# 	usermod -aG video wolframengine
	cd ${HOME}
	wget --no-verbose https://archive.raspberrypi.org/debian/pool/main/w/wolfram-engine/wolfram-engine_14.3.0+202510021899_arm64.deb
	yes | apt-get install -y ./wolfram-engine_14.3.0+202510021899_arm64.deb
	rm ./wolfram-engine_14.3.0+202510021899_arm64.deb
	cp -r /opt/Wolfram/WolframEngine/14.3/SystemFiles/Links/WSTP/DeveloperKit/Linux-ARM64/CompilerAdditions/wstp.h /usr/local/include/
	cp -r /opt/Wolfram/WolframEngine/14.3/SystemFiles/Libraries/Linux-ARM64/* /usr/local/lib/
	ldconfig
# 	su - wolframengine
#---	test the installation by running `wolfram` in the terminal, and then exit the container.
	docker commit hand-build-wolframengine-arm64 ghcr.io/massimo-nocentini/wolframengine.docker:14.3
	docker rm hand-build-wolframengine-arm64
	docker push ghcr.io/massimo-nocentini/wolframengine.docker:14.3