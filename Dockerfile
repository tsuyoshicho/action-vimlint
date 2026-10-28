# hadolint ignore=DL3007
FROM thinca/vim:latest@sha256:43509e6e0997f9d618a3341a1617f854b30f569fc902f7bc4c1bb07a2a67945a

# reviewdog
ENV REVIEWDOG_VERSION=v0.21.2

# hadolint ignore=DL4006
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
# hadolint ignore=DL3018
RUN apk add --no-cache git && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
