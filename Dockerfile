FROM iganarix/cld-gcloud:374.0.0-alpine

ENV _tf_ver='1.1.7'

RUN cd /usr/local/bin && \
    wget https://releases.hashicorp.com/terraform/${_tf_ver}/terraform_${_tf_ver}_linux_arm64.zip && \
    unzip terraform_${_tf_ver}_linux_arm64.zip && \
    rm -f terraform_${_tf_ver}_linux_arm64.zip
