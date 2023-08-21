FROM registry.access.redhat.com/ubi9/go-toolset:1.18.9-14
ARG REL_VER
COPY . .
RUN git config --global --add safe.directory .
RUN make prepare_release version=$REL_VER
