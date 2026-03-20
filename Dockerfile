# hadolint ignore=DL3007
FROM thinca/vim:latest@sha256:5b8e47f66542bd7943a4338f3db1ac0d7043eed23c07231c83e68df19e51ab20

# reviewdog
ENV REVIEWDOG_VERSION=v0.21.0

# hadolint ignore=DL4006
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
# hadolint ignore=DL3018
RUN apk add --no-cache git && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
