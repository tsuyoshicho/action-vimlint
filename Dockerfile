# hadolint ignore=DL3007
FROM thinca/vim:latest@sha256:683c7fa141faec2fe69523c7e80bf8322a6f9a031b8f24e4fdde62940e52410d

# reviewdog
ENV REVIEWDOG_VERSION=v0.20.3

# hadolint ignore=DL4006
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
# hadolint ignore=DL3018
RUN apk add --no-cache git && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
