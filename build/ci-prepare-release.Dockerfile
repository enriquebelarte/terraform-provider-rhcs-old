FROM registry.access.redhat.com/ubi9/go-toolset:latest
# terraform-provider-rhcs repo
COPY . .
ENV GOFLAGS=-buildvcs=false
RUN git config --global --add safe.directory /workspace/releases
RUN make prepare_release
