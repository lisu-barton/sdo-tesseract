#
# Dockerfile for tesseract
#

FROM scratch
ADD centos-7-docker.tar.xz /

LABEL org.label-schema.schema-version="1.0" \
    org.label-schema.name="CentOS Base Image" \
    org.label-schema.vendor="CentOS" \
    org.label-schema.license="GPLv2" \
    org.label-schema.build-date="20181205"

MAINTAINER kev <noreply@sdosoft.pro>

RUN yum update \
    && yum install -y autoconf \
                          build-essential \
                          git \
                          libcairo2 \
                          libcairo2-dev \
                          libgomp1 \
                          libicu52 \
                          libicu-dev \
                          liblept4 \
                          libleptonica-dev \
                          libpango1.0-0 \
                          libpango1.0-dev \
                          libtool 

# ENTRYPOINT ["tesseract"]
# CMD ["-h"]

CMD ["/bin/bash"]
