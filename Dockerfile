FROM registry.access.redhat.com/ubi9/go-toolset:1.18.9-14
LABEL description="Terraform Provider RHCS"
LABEL io.k8s.description=""
LABEL com.redhat.component=""
LABEL distribution-scope=""
LABEL name="terraform-provider-rhcs" release="X.Y" url="https://github.com/enriquebelarte/terraform-provider-rhcs"
LABEL vendor="Red Hat"
LABEL version="X.Y"
ARG REL_VER
COPY . .
RUN git config --global --add safe.directory .
RUN make prepare_release version=$REL_VER
