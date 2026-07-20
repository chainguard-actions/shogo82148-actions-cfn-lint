<!-- markdownlint-disable -->

# Hardening Report: shogo82148--actions-cfn-lint/v4.65.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **shogo82148--actions-cfn-lint/v4.65.0** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The action.yml uses a Docker image referenced by a mutable version tag (`4.65.0`) instead of an immutable SHA digest. This means the image could be replaced with a different (potentially malicious) version without changing the reference. The failing reference is: `image: "docker://ghcr.io/shogo82148/actions-cfn-lint:4.65.0"`. It should be replaced with a SHA-digest reference such as `image: "docker://ghcr.io/shogo82148/actions-cfn-lint@sha256:<64-hex-char-digest>"`.

Locations:

- `action.yml:50`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Pinned the Docker image reference in action.yml from the mutable tag `4.65.0` to the immutable digest `sha256:d91bdb092fb1b3e5ce1f0ebc8117f88f0e825cda540ed69842b95f38e1f8af94`. The `docker://` scheme and `:4.65.0` tag are preserved inline in the reference: `docker://ghcr.io/shogo82148/actions-cfn-lint:4.65.0@sha256:d91bdb092fb1b3e5ce1f0ebc8117f88f0e825cda540ed69842b95f38e1f8af94`.

