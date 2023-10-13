FROM registry.access.redhat.com/ubi9/go-toolset:latest AS builder
LABEL description="Terraform Provider RHCS"
LABEL io.k8s.description=""
LABEL com.redhat.component=""
LABEL distribution-scope=""
LABEL name="terraform-provider-rhcs" release="X.Y" url="https://github.com/enriquebelarte/terraform-provider-rhcs"
LABEL vendor="Red Hat"
LABEL version="X.Y"


# terraform-provider-rhcs repo
COPY . .

ENV GOFLAGS=-buildvcs=false

RUN git config --global --add safe.directory /opt/app-root/src && \
    make prepare_release

FROM scratch
COPY --from=builder /opt/app-root/src/releases /releases

