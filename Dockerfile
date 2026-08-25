# hadolint ignore=DL3007
FROM thinca/vim:latest@sha256:b35998f8682260693f03b0f9473bc9193e0bf2fe10ff48b1a2ca5a9f0c2b6ba1

# reviewdog
ENV REVIEWDOG_VERSION=v0.21.0

# hadolint ignore=DL4006
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
# hadolint ignore=DL3018
RUN apk add --no-cache git && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
