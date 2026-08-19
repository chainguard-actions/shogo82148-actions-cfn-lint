FROM python:3.13.7-alpine3.21

# install cfn-lint
COPY requirements.txt /requirements.txt
RUN apk --no-cache add git bash && pip install --upgrade pip && pip install --no-cache -r /requirements.txt

# install reviewdog
# Download the install script to a file first, then execute it separately
# (avoids piping remote content directly to a shell interpreter)
RUN wget -O /tmp/install-reviewdog.sh -q https://raw.githubusercontent.com/reviewdog/reviewdog/v0.20.3/install.sh \
    && sh /tmp/install-reviewdog.sh -b /usr/local/bin/ v0.20.3 \
    && rm /tmp/install-reviewdog.sh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
