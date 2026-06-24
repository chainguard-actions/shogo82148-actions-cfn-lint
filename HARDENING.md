<!-- markdownlint-disable -->

# Hardening Report: shogo82148--actions-cfn-lint/v4.64.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `1`

Action **shogo82148--actions-cfn-lint/v4.64.0** was hardened automatically. 2 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The action.yml runs.image field references a mutable Docker image tag ('docker://ghcr.io/shogo82148/actions-cfn-lint:4.64.0') instead of a SHA digest. This means the image could be silently replaced with a different (potentially malicious) version without changing the reference. It should be pinned to a SHA digest, e.g. 'docker://ghcr.io/shogo82148/actions-cfn-lint@sha256:<64-hex-char-digest>'.

Locations:

- `action.yml:56`

### unsafe-shell (severity: high)

The Dockerfile installs reviewdog by piping a remote shell script directly to 'sh' via wget: 'wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/ v0.20.3'. This is unsafe because the remote content is executed without any integrity verification. The script should be downloaded to a file first, its checksum verified against a known-good value, and then executed separately.

Locations:

- `Dockerfile:7`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses, unsafe-shell

**Notes:**

1. action.yml: Pinned the Docker image reference from mutable tag 'ghcr.io/shogo82148/actions-cfn-lint:4.64.0' to immutable digest 'ghcr.io/shogo82148/actions-cfn-lint@sha256:ffb91ac907f57d64523c0dee4ea525df502c3886804103c86a59a3c50f02476e' with the tag preserved as a comment outside the quotes.
2. Dockerfile: Replaced the unsafe 'wget -O - -q https://...install.sh | sh -s -- ...' pattern with a safe approach that downloads the reviewdog binary tarball and its official checksums file from the versioned GitHub release (v0.20.3), verifies the SHA256 checksum, then extracts and installs the binary. Also pinned the base image python:3.13.7-alpine3.21 to its SHA256 digest.

