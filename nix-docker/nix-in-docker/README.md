# Nix in Docker

## Nix docker containers

1. Run the Nix docker container (about 500MB)
docker run -it nixos/nix

2. Enable nix flakes
RUN echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf
