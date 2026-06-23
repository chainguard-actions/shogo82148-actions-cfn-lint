<!-- markdownlint-disable -->

# Hardening Report: shogo82148--actions-cfn-lint/v4.61.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `1`

Action **shogo82148--actions-cfn-lint/v4.61.0** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The action.yml uses a Docker image referenced by a mutable tag ('4.61.0') rather than an immutable SHA digest. This means the image could be replaced with a different (potentially malicious) version without changing the reference. The failing reference is: `image: "docker://ghcr.io/shogo82148/actions-cfn-lint:4.61.0"`. It should be pinned to a SHA digest, e.g. `image: "docker://ghcr.io/shogo82148/actions-cfn-lint@sha256:<64-hex-char-digest>"`.

Locations:

- `action.yml:52`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Replaced the mutable Docker image tag reference 'ghcr.io/shogo82148/actions-cfn-lint:4.61.0' with the immutable SHA digest 'ghcr.io/shogo82148/actions-cfn-lint@sha256:1b53d1365b77fd43e27c00798b7513f4ef10f856be2f9e0f9913f7d0484aaf34' in action.yml line 52. The original tag '4.61.0' is preserved as a comment for readability.

