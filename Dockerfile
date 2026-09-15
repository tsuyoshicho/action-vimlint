# hadolint ignore=DL3007
FROM thinca/vim:latest@sha256:40327c00eee1fa0d0e71e1ed71243f5967c6f40431d041b6d50e356ae9c64025

# reviewdog
ENV REVIEWDOG_VERSION=v0.21.1

# hadolint ignore=DL4006
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
# hadolint ignore=DL3018
RUN apk add --no-cache git && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
