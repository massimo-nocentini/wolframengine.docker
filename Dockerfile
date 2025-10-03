
FROM wolframresearch/wolframengine:14.3

WORKDIR /home/wolframengine

LABEL org.opencontainers.image.description="Wolfram Engine with WSTP development files. \
This image is based on _wolframresearch/wolframengine:14.3_. In order to use it without asking for authentication, \
please mount a volume with your Wolfram ID and password on the file `/home/wolframengine/.WolframEngine/Licensing`."

RUN cp /usr/local/Wolfram/WolframEngine/14.3/SystemFiles/Links/WSTP/DeveloperKit/Linux-x86-64/CompilerAdditions/wstp.h . \
 && cp /usr/local/Wolfram/WolframEngine/14.3/SystemFiles/Links/WSTP/DeveloperKit/Linux-x86-64/CompilerAdditions/libWSTP64i4.so .



