ARG FROM
FROM ${FROM}

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && \
  apt upgrade -y && \
  apt -y install john vim less nano bash-completion tmux && \
  apt clean && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /root

ARG CREATED
ARG REVISION
ARG VERSION
ARG TITLE
ARG DESCRIPTION
ARG URL

LABEL \
  org.opencontainers.image.title="${TITLE}" \
  org.opencontainers.image.description="${DESCRIPTION}" \
  org.opencontainers.image.url="${URL}" \
  org.opencontainers.image.created="${CREATED}" \
  org.opencontainers.image.revision="${REVISION}" \
  org.opencontainers.image.version="${VERSION}-${REVISION}" \
  org.opencontainers.image.source="${URL}" \
  org.opencontainers.image.authors="Adhidarma Hadiwinoto  <adhisimon@tektrans.id>" \
  org.opencontainers.image.vendor="TEKTRANS" \
  org.opencontainers.image.licenses="GPL-2.0-or-later"
