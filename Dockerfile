# hadolint ignore=DL3007
FROM thinca/vim:latest@sha256:c9a0a12b18e9be32d8c8107bc0e625db521ea36425bd547332a0a5f89f9a054e

# reviewdog
ENV REVIEWDOG_VERSION=v0.21.0

# hadolint ignore=DL4006
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
# hadolint ignore=DL3018
RUN apk add --no-cache git && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
