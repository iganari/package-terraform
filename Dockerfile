ARG _TAG='3.9.6'
FROM alpine:${_TAG}
# https://hub.docker.com/r/google/cloud-sdk/

# setting timezone
RUN apk --update add tzdata \
    && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && apk del tzdata \
    && rm -rf /var/cache/apk/*

# install git
RUN apk --update add git curl\
    && rm -rfv /var/lib/apt/lists/* \
    && rm -rfv /var/cache/apk/*

# https://releases.hashicorp.com/terraform/
ARG _terraform_version='0.12.24'
RUN curl https://releases.hashicorp.com/terraform/${_terraform_version}/terraform_${_terraform_version}_linux_amd64.zip -o /usr/local/bin/terraform_${_terraform_version}_linux_amd64.zip \
    && cd /usr/local/bin/ \
    && unzip terraform_${_terraform_version}_linux_amd64.zip \
    && rm -f /usr/local/bin/terraform_${_terraform_version}_linux_amd64.zip

ENTRYPOINT ["terraform"]
