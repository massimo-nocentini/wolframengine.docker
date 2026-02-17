
WOLFRAM_VERSION=14.3
WOLFRAM_DEFAULT_PORT=31415
WOLFRAM_PORT_FORWARD=31415

run:
	docker run -it --rm -v ./Licensing:/home/wolframengine/.WolframEngine/Licensing wolframresearch/wolframengine:${WOLFRAM_VERSION}
# 	docker run --user wolframengine -it --rm -v ./Licensing/mathpass:/opt/Wolfram/WolframEngine/${WOLFRAM_VERSION}/Configuration/Licensing/mathpass ghcr.io/massimo-nocentini/wolframengine.docker:${WOLFRAM_VERSION}

wstpserver:
	docker run -it --rm \
		--entrypoint /usr/local/Wolfram/WolframEngine/${WOLFRAM_VERSION}/SystemFiles/Links/WSTPServer/wstpserver \
		-v ./Licensing:/home/wolframengine/.WolframEngine/Licensing \
		-v ./wstpserver.conf:/home/wolframengine/wstpserver.conf \
		-p ${WOLFRAM_PORT_FORWARD}:${WOLFRAM_DEFAULT_PORT} \
		wolframresearch/wolframengine:${WOLFRAM_VERSION} \
		-c /home/wolframengine/wstpserver.conf