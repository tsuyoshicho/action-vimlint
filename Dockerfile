# hadolint ignore=DL3007
FROM thinca/vim:latest@sha256:e6db7cd9157dc6167eb808c4edec5030174f0f14cb6674a31b00971b3e9784a2

# reviewdog
ENV REVIEWDOG_VERSION=v0.21.2

# hadolint ignore=DL4006
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
# hadolint ignore=DL3018
RUN apk add --no-cache git && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
