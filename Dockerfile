FROM google/cloud-sdk:289.0.0-alpine

ENV KUBECTL_VERSION v1.18.2
ENV HELM_VERSION v3.1.2
ENV HELM2_VERSION v2.16.6
ENV KUBEVAL_VERSION 0.14.0
ENV SOPS_VERSION v3.5.0
ENV YQ_BIN_VERSION 2.4.1

COPY entrypoint.sh entrypoint.sh
COPY commands.sh /data/commands.sh
COPY install.sh /tmp/install.sh
COPY helm-init.sh /tmp/helm-init.sh

RUN chmod +x /tmp/install.sh /tmp/helm-init.sh && \
    /tmp/install.sh

VOLUME /data

USER gkh

RUN /tmp/helm-init.sh

ENTRYPOINT ["/entrypoint.sh"]
