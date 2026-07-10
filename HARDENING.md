<!-- markdownlint-disable -->

# Hardening Report: shogo82148--actions-cfn-lint/v4.66.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `1`

Action **shogo82148--actions-cfn-lint/v4.66.0** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The action.yml uses a Docker image referenced by a mutable version tag rather than an immutable SHA digest. The image `docker://ghcr.io/shogo82148/actions-cfn-lint:4.66.0` uses the tag `4.66.0`, which can be overwritten at any time, enabling a supply-chain attack. It should be pinned to a SHA digest, e.g. `docker://ghcr.io/shogo82148/actions-cfn-lint@sha256:<64-hex-char-digest>`.

Locations:

- `action.yml:55`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Pinned the Docker image reference in action.yml from the mutable tag `ghcr.io/shogo82148/actions-cfn-lint:4.66.0` to the immutable SHA256 digest `ghcr.io/shogo82148/actions-cfn-lint@sha256:1f28a18de8c241bcd3bc562f2b24fba2d4d503af4ff1588f29d89538d83ff181`. The original tag is preserved as a comment for readability. The comment is placed outside the YAML string quotes as required.

