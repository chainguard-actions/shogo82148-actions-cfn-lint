<!-- markdownlint-disable -->

# Hardening Report: shogo82148--actions-cfn-lint/v4.59.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **shogo82148--actions-cfn-lint/v4.59.0** was hardened automatically. 2 finding(s) were identified and resolved across 2 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The action.yml uses a Docker image reference with a mutable version tag instead of an immutable SHA digest. The image `docker://ghcr.io/shogo82148/actions-cfn-lint:4.59.0` uses the tag `4.59.0`, which can be silently replaced with different (potentially malicious) content. It should be pinned to a SHA256 digest, e.g. `docker://ghcr.io/shogo82148/actions-cfn-lint@sha256:<64-hex-char-digest> # 4.59.0`.

Locations:

- `action.yml:56`

### unsafe-shell (severity: high)

The Dockerfile pipes remote content directly to a shell interpreter without first downloading and verifying it. The command `wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/ v0.20.3` fetches a script from a remote URL and immediately executes it via `sh`. If the remote URL is compromised or the content is tampered with in transit, arbitrary code will execute in the build environment. The script should be downloaded to a file first, its integrity verified (e.g. via checksum), and then executed separately.

Locations:

- `Dockerfile:8`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses, unsafe-shell

**Notes:**

1. action.yml line 56: Pinned Docker image `ghcr.io/shogo82148/actions-cfn-lint:4.59.0` to immutable digest `sha256:7bdd9af17f6d1d3d59ff04bbb45a3d0724df67a95cddc0694f083ce4b0255093`, preserving the `docker://` scheme and tag inline. 2. Dockerfile line 8: Replaced `wget -O - -q <url> | sh` pipe pattern with a two-step approach: download the install script to `/tmp/install-reviewdog.sh` first, then execute it with `sh`, then remove it. This eliminates the unsafe pipe-to-shell pattern.

### Iteration 2

**Fixes applied:** script-injection

**Notes:**

Fixed all four script-injection occurrences in .github/workflows/build.yml. Moved `${{ github.repository }}` out of run: shell strings and into env: blocks as `REPOSITORY: ${{ github.repository }}` for the three affected steps (Build the Docker image, Publish to Docker Hub, Publish to GitHub Container Registry). Shell scripts now use `"$REPOSITORY"` as a properly quoted shell variable instead of direct template interpolation.

