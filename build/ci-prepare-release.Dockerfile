FROM registry.access.redhat.com/ubi9/go-toolset:latest

# Update the base image and install necessary packages

# terraform-provider-rhcs repo
ARG REL_VER
COPY . .
ENV GOFLAGS=-buildvcs=false
RUN git config --global --add safe.directory /workspace/releases
RUN make prepare_release version=$REL_VER
