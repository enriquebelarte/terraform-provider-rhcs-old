FROM registry.access.redhat.com/ubi9/go-toolset:latest AS builder
# terraform-provider-rhcs repo
COPY . .

ENV GOFLAGS=-buildvcs=false

RUN git config --global --add safe.directory /opt/app-root/src && \
    make prepare_release

FROM scratch
COPY --from=builder /opt/app-root/src/releases /releases
