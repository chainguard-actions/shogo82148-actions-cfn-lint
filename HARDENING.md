<!-- markdownlint-disable -->

# Hardening Report: shogo82148--actions-cfn-lint/v4.62.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **shogo82148--actions-cfn-lint/v4.62.0** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The action.yml uses a Docker image referenced by a mutable tag (`4.62.0`) instead of an immutable SHA digest. This means the image could be silently replaced with a different (potentially malicious) version without any change to the action source. The failing reference is: `image: "docker://ghcr.io/shogo82148/actions-cfn-lint:4.62.0"`. It should be replaced with a SHA-digest reference such as `image: "docker://ghcr.io/shogo82148/actions-cfn-lint@sha256:<64-hex-char-digest>"`.

Locations:

- `action.yml:54`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Pinned the Docker image reference in action.yml from `docker://ghcr.io/shogo82148/actions-cfn-lint:4.62.0` to `docker://ghcr.io/shogo82148/actions-cfn-lint:4.62.0@sha256:5926d3c88c24ff0210d470d7ff3b78f56dcced82b74dc63d1da234143cf7141d`. The `docker://` scheme and `:4.62.0` tag are preserved inline alongside the immutable digest.

