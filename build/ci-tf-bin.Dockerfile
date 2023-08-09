FROM registry.access.redhat.com/ubi8/go-toolset:latest AS builder
WORKDIR /root

# Update the base image and install necessary packages
RUN sudo dnf update -y && \
    sudo dnf install -y git make

# terraform-provider-rhcs repo
COPY . ./terraform-provider-rhcs


RUN cd terraform-provider-rhcs && go mod tidy && go mod vendor && make build &&\
    echo 'RUN done'

FROM registry.access.redhat.com/ubi8/ubi-minimal:latest
WORKDIR /root
COPY --from=builder /root/terraform-provider-rhcs* /root/
