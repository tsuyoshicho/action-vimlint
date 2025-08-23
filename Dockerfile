# hadolint ignore=DL3007
FROM thinca/vim:latest@sha256:98d13b9dff828b0d3e8f5e9d87a45e37d00e91a88ed2bc4554152d330a92e3ed

# reviewdog
ENV REVIEWDOG_VERSION=v0.20.3

# hadolint ignore=DL4006
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
# hadolint ignore=DL3018
RUN apk add --no-cache git && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
