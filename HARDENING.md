<!-- markdownlint-disable -->

# Hardening Report: shogo82148--actions-cfn-lint/v4.63.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `1`

Action **shogo82148--actions-cfn-lint/v4.63.0** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The action.yml uses a Docker image reference with a mutable version tag instead of a SHA256 digest: `image: "docker://ghcr.io/shogo82148/actions-cfn-lint:4.63.0"`. A tag can be silently overwritten to point to a different (potentially malicious) image, enabling supply-chain attacks. The image reference should use a SHA digest, e.g. `docker://ghcr.io/shogo82148/actions-cfn-lint@sha256:<64-hex-char-digest>`

Locations:

- `action.yml:51`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Replaced the mutable Docker image tag `ghcr.io/shogo82148/actions-cfn-lint:4.63.0` with the immutable SHA256 digest `ghcr.io/shogo82148/actions-cfn-lint@sha256:0bf4b4b3540ece900300c1ba7bad504978c1c4b9419a001ec9ace43573fdf3e6` in action.yml line 51. The original tag is preserved as a comment for readability.

