<!-- markdownlint-disable -->

# Hardening Report: shogo82148--actions-cfn-lint/v4.61.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **shogo82148--actions-cfn-lint/v4.61.0** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The action.yml uses a Docker image reference with a mutable version tag instead of an immutable SHA digest. `image: "docker://ghcr.io/shogo82148/actions-cfn-lint:4.61.0"` uses the tag `4.61.0`, which can be overwritten at any time, enabling a supply-chain attack. It should be pinned to a SHA digest, e.g. `image: "docker://ghcr.io/shogo82148/actions-cfn-lint@sha256:<64-hex-char-digest> # 4.61.0"`.

Locations:

- `action.yml:57`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Pinned the Docker image reference in action.yml from `docker://ghcr.io/shogo82148/actions-cfn-lint:4.61.0` to `docker://ghcr.io/shogo82148/actions-cfn-lint:4.61.0@sha256:1b53d1365b77fd43e27c00798b7513f4ef10f856be2f9e0f9913f7d0484aaf34`. The `docker://` scheme and `:4.61.0` tag are preserved inline alongside the immutable digest.

