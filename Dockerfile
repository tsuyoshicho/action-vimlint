# hadolint ignore=DL3007
FROM thinca/vim:latest@sha256:b01cf57d79cec1e14f0ccfeafbe23c1ee6f445252e55d8ebe692f1af36ddb5fc

# reviewdog
ENV REVIEWDOG_VERSION=v0.20.3

# hadolint ignore=DL4006
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
# hadolint ignore=DL3018
RUN apk add --no-cache git && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
