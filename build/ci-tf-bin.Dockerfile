FROM registry.access.redhat.com/ubi8/go-toolset:latest

# Update the base image and install necessary packages

# terraform-provider-rhcs repo
COPY . .
ENV GOFLAGS=-buildvcs=false

