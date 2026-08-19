<!-- markdownlint-disable -->

# Hardening Report: shogo82148--actions-cfn-lint/v4.64.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **shogo82148--actions-cfn-lint/v4.64.0** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The action.yml uses `runs.using: docker` with a mutable image tag reference (`docker://ghcr.io/shogo82148/actions-cfn-lint:4.64.0`) instead of a SHA digest. A tag can be silently overwritten to point to a different image, enabling a supply-chain attack. The image reference should be pinned to a SHA digest, e.g. `docker://ghcr.io/shogo82148/actions-cfn-lint@sha256:<64-hex-char-digest>`.

Locations:

- `action.yml:56`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Pinned the Docker container image reference in action.yml from `docker://ghcr.io/shogo82148/actions-cfn-lint:4.64.0` to `docker://ghcr.io/shogo82148/actions-cfn-lint:4.64.0@sha256:ffb91ac907f57d64523c0dee4ea525df502c3886804103c86a59a3c50f02476e`. The docker:// scheme and :4.64.0 tag are preserved inline with the digest appended, preventing supply-chain attacks via mutable tag overwrites.

