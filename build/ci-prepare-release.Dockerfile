FROM registry.access.redhat.com/ubi9/go-toolset:latest
# terraform-provider-rhcs repo
COPY . .

ENV GOFLAGS=-buildvcs=false

#RUN git config --global --add safe.directory /workspace/releases
RUN export REL_VER=$(git describe --tags `git rev-list --tags --max-count=1`) && echo "REL_VER=$REL_VER" && pwd && make prepare_release
