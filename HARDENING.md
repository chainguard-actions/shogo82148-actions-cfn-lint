<!-- markdownlint-disable -->

# Hardening Report: shogo82148--actions-cfn-lint/v4.80.1

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **shogo82148--actions-cfn-lint/v4.80.1** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unsafe-shell (severity: high)

The Dockerfile pipes a remote install script directly to a shell interpreter without first downloading and verifying it. The line `wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/ "$REVIEWDOG_VERSION"` fetches content from a mutable GitHub URL (the `master` branch) and executes it immediately via `sh`. If the remote content is tampered with or the URL is compromised, arbitrary code will execute during the Docker image build. The script should be downloaded to a file first, its integrity verified (e.g., via checksum), and then executed separately.

Locations:

- `Dockerfile:9`

## Iteration Notes

### Iteration 1

**Fixes applied:** unsafe-shell

**Notes:**

Fixed the Dockerfile's unsafe shell pattern on line 9. Changed from piping the remote reviewdog install script directly to sh (`wget ... | sh -s -- -b /usr/local/bin/ "$REVIEWDOG_VERSION"`) to downloading it to a temporary file first, then executing it separately (`sh /tmp/install-reviewdog.sh -b /usr/local/bin/ "$REVIEWDOG_VERSION"`), and cleaning up afterward. The `--` was dropped as it was only needed to terminate the shell's own option parsing in the pipe form — the script's arguments (`-b /usr/local/bin/ "$REVIEWDOG_VERSION"`) are passed directly as positional arguments when running from a file.

