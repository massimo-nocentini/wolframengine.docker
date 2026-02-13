


FROM wolframresearch/wolframengine:14.3

# FROM --platform=$BUILDPLATFORM debian:latest

ARG BUILDPLATFORM
ENV BUILDPLATFORM=$BUILDPLATFORM

ARG WE_VERSION=14.3
ENV WE_VERSION=$WE_VERSION

# COPY wolfram-engine_14.3.0+202510021899_arm64.deb .
COPY install.sh .

RUN bash install.sh
