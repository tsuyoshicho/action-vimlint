# hadolint ignore=DL3007
FROM thinca/vim:latest@sha256:7d7394f29feb4d0b7144fe2e5b98a812f10f8c0a74640ae3012ad7944b605faa

# reviewdog
ENV REVIEWDOG_VERSION=v0.21.2

# hadolint ignore=DL4006
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
# hadolint ignore=DL3018
RUN apk add --no-cache git && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
