<!-- markdownlint-disable -->

# Hardening Report: shogo82148--actions-cfn-lint/v4.60.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `1`

Action **shogo82148--actions-cfn-lint/v4.60.0** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The action.yml Docker image reference uses a mutable version tag instead of an immutable SHA digest. `image: "docker://ghcr.io/shogo82148/actions-cfn-lint:4.60.0"` should be pinned to a SHA256 digest (e.g. `docker://ghcr.io/shogo82148/actions-cfn-lint@sha256:<64-hex-char-digest>`) to prevent supply-chain attacks where the tag could be silently replaced with a malicious image.

Locations:

- `action.yml:54`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Pinned the Docker image reference in action.yml from the mutable tag `ghcr.io/shogo82148/actions-cfn-lint:4.60.0` to the immutable digest `ghcr.io/shogo82148/actions-cfn-lint@sha256:fdae51cd0e6a5499822e2ced9b39105f40f192961e9358b47c15e1297e3ea70c` with the original tag preserved as a comment.

