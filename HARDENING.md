<!-- markdownlint-disable -->

# Hardening Report: shogo82148--actions-cfn-lint/v4.63.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **shogo82148--actions-cfn-lint/v4.63.0** was hardened automatically. 2 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The action.yml `runs.image:` field references the Docker image `ghcr.io/shogo82148/actions-cfn-lint:4.63.0` using a mutable version tag (`4.63.0`) instead of an immutable SHA digest (e.g., `ghcr.io/shogo82148/actions-cfn-lint@sha256:<64-hex-char-digest>`). A mutable tag can be silently redirected to a different image, enabling supply-chain attacks.

Locations:

- `action.yml:52`

### unsafe-shell (severity: high)

The Dockerfile pipes remote content directly to a shell interpreter: `wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/ v0.20.3`. If the remote URL is compromised or the content changes, arbitrary code will be executed during the Docker image build. The script should be downloaded to a file first, its integrity verified (e.g., via checksum), and then executed separately.

Locations:

- `Dockerfile:8`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses, unsafe-shell

**Notes:**

1. action.yml: Pinned the Docker image reference from 'docker://ghcr.io/shogo82148/actions-cfn-lint:4.63.0' to 'docker://ghcr.io/shogo82148/actions-cfn-lint:4.63.0@sha256:0bf4b4b3540ece900300c1ba7bad504978c1c4b9419a001ec9ace43573fdf3e6' using the immutable digest resolved via the Docker Registry API. The docker:// scheme and version tag are preserved. 2. Dockerfile: Replaced the unsafe 'wget ... | sh' pipe pattern with a two-step approach: download the reviewdog install script to /tmp/install-reviewdog.sh first, then execute it separately with 'sh /tmp/install-reviewdog.sh'. Also changed the URL from the mutable 'master' branch reference to the pinned 'v0.20.3' tag to avoid fetching from a mutable reference.

