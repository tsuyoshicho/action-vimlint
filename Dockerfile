# hadolint ignore=DL3007
FROM thinca/vim:latest@sha256:b9b2717dbc64f2bf0ede99116b72ef8159cca313c18a60fbd4591573159bd953

# reviewdog
ENV REVIEWDOG_VERSION=v0.21.1

# hadolint ignore=DL4006
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
# hadolint ignore=DL3018
RUN apk add --no-cache git && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
