# hadolint ignore=DL3007
FROM thinca/vim:latest@sha256:bfd7b903e7fa25d7b3b9439522aeb3c53f379abbde2fddff5862a2f4779b75ac

# reviewdog
ENV REVIEWDOG_VERSION=v0.21.0

# hadolint ignore=DL4006
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
# hadolint ignore=DL3018
RUN apk add --no-cache git && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
