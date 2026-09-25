FROM python:3.14.7-alpine3.24@sha256:9e9fde4d32eedce0b661d9ab91e826b62dddf28e928c230ec55f1866cac66b01

# install cfn-lint
COPY requirements.txt /requirements.txt
RUN apk --no-cache add git bash && pip install --upgrade pip && pip install --no-cache -r /requirements.txt

# install reviewdog
ENV REVIEWDOG_VERSION=v0.21.2
RUN wget -q -O /tmp/install-reviewdog.sh https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh \
    && sh /tmp/install-reviewdog.sh -b /usr/local/bin/ "$REVIEWDOG_VERSION" \
    && rm /tmp/install-reviewdog.sh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
