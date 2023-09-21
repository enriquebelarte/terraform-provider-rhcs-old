FROM registry.access.redhat.com/ubi9/go-toolset:latest
# terraform-provider-rhcs repo
ARG REL_VER
COPY . .
ENV GOFLAGS=-buildvcs=false
RUN git config --global --add safe.directory /workspace/releases
RUN export REL_VER=$(git describe --tags `git rev-list --tags --max-count=1`);make prepare_release version=${REL_VER}
