


FROM wolframresearch/wolframengine:14.3 AS weofficial

# FROM --platform=$BUILDPLATFORM debian:latest

ARG BUILDPLATFORM
ENV BUILDPLATFORM=$BUILDPLATFORM

ARG WE_VERSION=14.3

# we can copy the WSTP development files from the official image to our custom image, 
# so that they are available for development without needing to install the full Wolfram Engine in the custom image. 
# This is useful for users who want to use the WSTP development files without needing to install the full Wolfram Engine 
# in their custom image. For the amd64 architecture, things are more straightforward, as the WSTP development files are
# available in the official image. For the arm64 architecture, we need to copy the WSTP development files from the official 
# image to our custom image, as they are not available in the official image for arm64.
COPY --from=weofficial /usr/local/Wolfram/WolframEngine/${WE_VERSION}/SystemFiles/Links/WSTP/DeveloperKit/Linux-x86-64/CompilerAdditions/wstp.h /usr/local/include/amd64/
COPY --from=weofficial /usr/local/Wolfram/WolframEngine/${WE_VERSION}/SystemFiles/Links/WSTP/DeveloperKit/Linux-x86-64/CompilerAdditions/libWSTP64i4.so /usr/local/lib/amd64/

# COPY wolfram-engine_14.3.0+202510021899_arm64.deb .
COPY install.sh .

RUN bash install.sh
