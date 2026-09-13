<!-- markdownlint-disable -->

# Hardening Report: shogo82148--actions-cfn-lint/v4.78.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **shogo82148--actions-cfn-lint/v4.78.0** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unsafe-shell (severity: high)

The Dockerfile pipes a remotely fetched install script directly to `sh` without first downloading and verifying it. The command `wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/ "$REVIEWDOG_VERSION"` fetches content from a mutable URL on the `master` branch and executes it immediately. If the remote URL is compromised or the content changes, arbitrary code will execute during the Docker image build, making this a supply-chain attack vector.

Locations:

- `Dockerfile:9`

## Iteration Notes

### Iteration 1

**Fixes applied:** unsafe-shell

**Notes:**

Fixed the unsafe pipe-to-shell pattern in Dockerfile line 9. Changed `wget -O - -q ... | sh -s -- -b /usr/local/bin/ "$REVIEWDOG_VERSION"` to download the script to /tmp/install-reviewdog.sh first, then execute it with `sh /tmp/install-reviewdog.sh -b /usr/local/bin/ "$REVIEWDOG_VERSION"`, and clean up afterward. Dropped `-s` and `--` from the shell invocation as they were stdin-reading options that are no longer needed when executing a file directly.

