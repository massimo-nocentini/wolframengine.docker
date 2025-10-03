
FROM wolframresearch/wolframengine:14.3
WORKDIR /home/wolframengine
COPY wstpserver.conf .
RUN cp /usr/local/Wolfram/WolframEngine/14.3/SystemFiles/Links/WSTP/DeveloperKit/Linux-x86-64/CompilerAdditions/wstp.h . \
 && cp /usr/local/Wolfram/WolframEngine/14.3/SystemFiles/Links/WSTP/DeveloperKit/Linux-x86-64/CompilerAdditions/libWSTP64i4.so .
CMD ["sh", "-c", "/usr/local/Wolfram/WolframEngine/14.3/SystemFiles/Links/WSTPServer/wstpserver --port ${WOLFRAM_PORT} -c /home/wolframengine/wstpserver.conf"]



