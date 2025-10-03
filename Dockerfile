
FROM wolframresearch/wolframengine:14.3
WORKDIR /home/wolframengine
RUN cp /usr/local/Wolfram/WolframEngine/14.3/SystemFiles/Links/WSTP/DeveloperKit/Linux-x86-64/CompilerAdditions/wstp.h . \
 && cp /usr/local/Wolfram/WolframEngine/14.3/SystemFiles/Links/WSTP/DeveloperKit/Linux-x86-64/CompilerAdditions/libWSTP64i4.so .



