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

yum update \
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
                          libtool \
    && git clone https://github.com/tesseract-ocr/tesseract.git \
        && cd tesseract \
        && ./autogen.sh \
        && ./configure \
        && make install \
        && cd .. \
    && git clone https://github.com/tesseract-ocr/tessdata.git \
        && cd tessdata \
        && mv * /usr/local/share/tessdata/ \
        && cd .. \
    && yum purge --auto-remove -y autoconf \
                                      build-essential \
                                      git \
                                      libcairo2-dev \
                                      libicu-dev \
                                      libleptonica-dev \
                                      libpango1.0-dev \
                                      libtool \
    && rm -rf tesseract tessdata /var/cache/apk/*

# ENTRYPOINT ["tesseract"]
# CMD ["-h"]

CMD ["/bin/bash"]
