ARG NUMERIC_TAG

FROM registry.access.redhat.com/ubi9/go-toolset:latest
# terraform-provider-rhcs repo
COPY . .

ENV GOFLAGS=-buildvcs=false

RUN git config --global --add safe.directory /opt/app-root/src && \
    ./get-latest-tag.sh > REL_VER && \

    echo "Tag name from GITHUB_REF_NAME: GITHUB_REF_NAME" && \
    echo "Tag name from github.ref_name: ${{ github.ref_name }}" && \

    make prepare_release version=$REL_VER

