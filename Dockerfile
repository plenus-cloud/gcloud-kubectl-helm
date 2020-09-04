FROM google/cloud-sdk:308.0.0-alpine

ENV KUBECTL_VERSION v1.19.0
ENV HELM_VERSION v3.3.1
ENV HELM2_VERSION v2.16.7
ENV KUBEVAL_VERSION 0.14.0
ENV SOPS_VERSION v3.5.0
ENV YQ_BIN_VERSION 2.4.1

COPY entrypoint.sh entrypoint.sh
COPY commands.sh /data/commands.sh
COPY install.sh /tmp/install.sh
COPY helm-init.sh /tmp/helm-init.sh

RUN chmod +x /tmp/install.sh /tmp/helm-init.sh
RUN /tmp/install.sh

VOLUME /data

USER gkh

RUN /tmp/helm-init.sh

ENTRYPOINT ["/entrypoint.sh"]
