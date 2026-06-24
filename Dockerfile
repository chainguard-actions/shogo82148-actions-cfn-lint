FROM python:3.13.7-alpine3.21@sha256:0c3d4f28025c9adc2c03326aa160dde8f53faaa8684134a0e146e4edca28a946 # 3.13.7-alpine3.21

# install cfn-lint
COPY requirements.txt /requirements.txt
RUN apk --no-cache add git bash && pip install --upgrade pip && pip install --no-cache -r /requirements.txt

# install reviewdog v0.20.3
# Download the binary and its checksum file from the versioned GitHub release,
# verify integrity before installing — never pipe remote scripts to a shell.
RUN REVIEWDOG_VERSION="v0.20.3" \
    && REVIEWDOG_BINARY="reviewdog_linux_amd64" \
    && wget -q -O /tmp/reviewdog.tar.gz \
        "https://github.com/reviewdog/reviewdog/releases/download/${REVIEWDOG_VERSION}/reviewdog_0.20.3_Linux_x86_64.tar.gz" \
    && wget -q -O /tmp/reviewdog_checksums.txt \
        "https://github.com/reviewdog/reviewdog/releases/download/${REVIEWDOG_VERSION}/reviewdog_0.20.3_checksums.txt" \
    && grep "reviewdog_0.20.3_Linux_x86_64.tar.gz" /tmp/reviewdog_checksums.txt | sha256sum -c - \
    && tar -xzf /tmp/reviewdog.tar.gz -C /usr/local/bin/ reviewdog \
    && chmod +x /usr/local/bin/reviewdog \
    && rm /tmp/reviewdog.tar.gz /tmp/reviewdog_checksums.txt

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
