


FROM wolframresearch/wolframengine:14.3 AS base

FROM --platform=$BUILDPLATFORM ubuntu:latest

ARG BUILDPLATFORM
ENV BUILDPLATFORM=$BUILDPLATFORM

ARG WE_VERSION=14.3
ENV WE_VERSION=$WE_VERSION

COPY --from=base /usr/local/Wolfram /usr/local/Wolfram
COPY install.sh .

RUN bash install.sh && rm install.sh