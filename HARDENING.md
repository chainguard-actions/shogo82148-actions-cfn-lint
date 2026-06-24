<!-- markdownlint-disable -->

# Hardening Report: shogo82148--actions-cfn-lint/v4.59.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `1`

Action **shogo82148--actions-cfn-lint/v4.59.0** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The action.yml uses a Docker image referenced by a mutable tag (`4.59.0`) instead of an immutable SHA digest. This means the image could be replaced with a different (potentially malicious) version without changing the action reference. The failing reference is: `image: "docker://ghcr.io/shogo82148/actions-cfn-lint:4.59.0"`. It should be pinned to a SHA digest, e.g. `image: "docker://ghcr.io/shogo82148/actions-cfn-lint@sha256:<64-hex-char-digest>"`

Locations:

- `action.yml:52`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Pinned the Docker image reference in action.yml from the mutable tag `ghcr.io/shogo82148/actions-cfn-lint:4.59.0` to the immutable SHA digest `ghcr.io/shogo82148/actions-cfn-lint@sha256:7bdd9af17f6d1d3d59ff04bbb45a3d0724df67a95cddc0694f083ce4b0255093` with the original tag preserved as a comment.

