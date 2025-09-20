FROM nixos/nix:latest

# Enable flakes globally and disable man pages
RUN echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf
ENV NIXPKGS_DISABLE_DOCS=1

# Clone your config
WORKDIR /root/.config/home-manager
ARG HOME_MANAGER_REPO=https://github.com/FelixTCP/nixos-mini
RUN git clone --depth=1 --branch main $REPO_URL .

# Build and activate Home Manager
RUN nix build .#homeConfigurations.root.activationPackage --out-link result && \
    ./result/activate

# Set PATH
ENV PATH="/root/.nix-profile/bin:$PATH"

# Remove no longer needed files (leads to ~900MiB freed)
RUN nix-collect-garbage -d

WORKDIR /workspace
CMD ["zsh", "-l"]