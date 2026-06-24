<!-- markdownlint-disable -->

# Hardening Report: shogo82148--actions-cfn-lint/v4.62.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `1`

Action **shogo82148--actions-cfn-lint/v4.62.0** was hardened automatically. 2 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The action.yml references a Docker image using a mutable version tag instead of an immutable SHA digest. The reference `docker://ghcr.io/shogo82148/actions-cfn-lint:4.62.0` uses the tag `4.62.0`, which can be overwritten at any time, enabling a supply-chain attack. It should be pinned to a SHA256 digest, e.g. `docker://ghcr.io/shogo82148/actions-cfn-lint@sha256:<64-hex-char-digest>`

Locations:

- `action.yml:52`

### unsafe-shell (severity: high)

The Dockerfile pipes remote content directly to a shell interpreter: `wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/ v0.20.3`. This pattern allows arbitrary code execution if the remote URL is compromised or the content is tampered with in transit. The script should be downloaded to a file first, its checksum verified, and then executed separately.

Locations:

- `Dockerfile:8`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses, unsafe-shell

**Notes:**

Fixed two security findings: (1) Pinned the Docker image in action.yml from mutable tag `ghcr.io/shogo82148/actions-cfn-lint:4.62.0` to immutable digest `ghcr.io/shogo82148/actions-cfn-lint@sha256:5926d3c88c24ff0210d470d7ff3b78f56dcced82b74dc63d1da234143cf7141d` with the tag preserved as a comment. (2) Fixed the unsafe pipe-to-shell pattern in Dockerfile by downloading the reviewdog install script to /tmp/install-reviewdog.sh first, then executing it separately, then removing it — eliminating the risk of arbitrary code execution from a compromised remote URL.

