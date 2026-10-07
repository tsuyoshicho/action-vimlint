# hadolint ignore=DL3007
FROM thinca/vim:latest@sha256:f7e3730769486b398c4a4071f34473877a9480a4fea557c17bdffa99aa517519

# reviewdog
ENV REVIEWDOG_VERSION=v0.21.2

# hadolint ignore=DL4006
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
# hadolint ignore=DL3018
RUN apk add --no-cache git && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
