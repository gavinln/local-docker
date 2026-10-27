# Multi-stage build using the official Nix container
FROM nixos/nix:2.28.8 AS builder

# Copy our nix files and setup our working dir.
COPY . /tmp/build

WORKDIR /tmp/build

# Build our Nix environment
RUN nix \
    --extra-experimental-features "nix-command flakes" \
    --option filter-syscalls false \
    build

# Copy the Nix store closure into a directory. The Nix store closure is the
# entire set of Nix store values that we need for our build.

RUN mkdir /tmp/nix-store-closure \
    && cp -R $(nix-store -qR result/) /tmp/nix-store-closure

# We copy a bunch of Nix dependencies
# but they're fully self-contained so we don't need Nix anymore.

FROM ubuntu:24.04

ENV repository=gavinln/local-docker.git

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  	bash ca-certificates git fd-find ripgrep \
  && rm -rf /var/lib/apt/lists/*

# directory for pi-agent
WORKDIR /app

# Copy /nix/store
COPY --from=builder /tmp/nix-store-closure /nix/store
COPY --from=builder /tmp/build/result /app

ENV PI_SKIP_VERSION_CHECK=1

ENV PI_TELEMETRY=0

# directory shared with host
WORKDIR /workspace

ENTRYPOINT ["/app/bin/pi"]

CMD ["/app/bin/pi", "--model", "deepseek/deepseek-flash"]
