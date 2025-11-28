# hadolint ignore=DL3007
FROM thinca/vim:latest@sha256:233a7724228c3a9b6ce0594eaa8111e2111a308c6e66e5d00ba52c707ae3802d

# reviewdog
ENV REVIEWDOG_VERSION=v0.21.0

# hadolint ignore=DL4006
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
# hadolint ignore=DL3018
RUN apk add --no-cache git && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
