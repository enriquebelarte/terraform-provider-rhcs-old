FROM registry.access.redhat.com/ubi9/go-toolset:latest

# Update the base image and install necessary packages

# terraform-provider-rhcs repo
COPY . .
ENV GOFLAGS=-buildvcs=false
