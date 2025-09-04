# hadolint ignore=DL3007
FROM thinca/vim:latest@sha256:3eee8907d9d3d73a5dffd73628525514a3ab61c611a5141f697c8aeb896d5751

# reviewdog
ENV REVIEWDOG_VERSION=v0.20.3

# hadolint ignore=DL4006
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
# hadolint ignore=DL3018
RUN apk add --no-cache git && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
