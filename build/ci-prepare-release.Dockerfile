FROM registry.access.redhat.com/ubi9/go-toolset:latest
# terraform-provider-rhcs repo
COPY . .

ENV GOFLAGS=-buildvcs=false

RUN git config --global --add safe.directory /opt/app-root/src && \
    echo "PWD IS: $(pwd)" && \
    ls -l && \
    ./build/get-latest-tag.sh > REL_VER && \
    make prepare_release version=$REL_VER

