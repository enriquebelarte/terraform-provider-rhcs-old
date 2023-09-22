FROM registry.access.redhat.com/ubi9/go-toolset:latest
# terraform-provider-rhcs repo
COPY . .

ENV GOFLAGS=-buildvcs=false

RUN git config --global --add safe.directory /opt/app-root/src && \
    cd /opt/app-root/src && \
    export REL_VER=$(git describe --tags `git rev-list --tags --max-count=1`) && \
    echo "REL_VER=$REL_VER" && \
    make prepare_release version=$REL_VER

