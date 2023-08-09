FROM  --platform=linux/amd64,linux/arm64 registry.access.redhat.com/ubi8/go-toolset:latest AS builder

# Update the base image and install necessary packages

# terraform-provider-rhcs repo
COPY . .

ENV GOFLAGS=-buildvcs=false
RUN make prepare_release version=12.0

