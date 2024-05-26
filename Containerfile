FROM registry.fedoraproject.org/fedora-toolbox:latest

LABEL com.github.containers.toolbox="true" \
      usage="runs Brave in distrobox" \
      summary="An Docker image with all three brave branches installed" \
      maintainer="dnkmmr"

RUN      dnf upgrade -y

RUN      dnf install -y make gcc file bash-completion bc bzip2 cracklib-dicts curl diffutils dnf-plugins-core findutils glibc-all-langpacks glibc-locale-source gnupg2 gnupg2-smime hostname iproute iputils keyutils krb5-libs less lsof man-db man-pages mtr ncurses nss-mdns openssh-clients pam passwd pigz pinentry procps-ng rsync shadow-utils sudo tcpdump time traceroute tree tzdata unzip util-linux vte-profile wget which whois words xorg-x11-xauth xz zip mesa-dri-drivers mesa-vulkan-drivers vulkan

RUN      dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

RUN      dnf install -y intel-media-driver nvidia-vaapi-driver
RUN      dnf swap -y mesa-va-drivers mesa-va-drivers-freeworld
RUN      dnf swap -y mesa-vdpau-drivers mesa-vdpau-drivers-freeworld

RUN dnf copr enable -y kylegospo/distrobox-utils && \
    dnf install -y \
        xdg-utils-distrobox \
        adw-gtk3-theme && \
    ln -s /usr/bin/distrobox-host-exec /usr/bin/flatpak

RUN      dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
RUN      rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
RUN      dnf install -y brave-browser

RUN      dnf config-manager --add-repo https://brave-browser-rpm-beta.s3.brave.com/brave-browser-beta.repo
RUN      rpm --import https://brave-browser-rpm-beta.s3.brave.com/brave-core-nightly.asc
RUN      dnf install -y brave-browser-beta

RUN      dnf config-manager --add-repo https://brave-browser-rpm-nightly.s3.brave.com/brave-browser-nightly.repo
RUN      rpm --import https://brave-browser-rpm-nightly.s3.brave.com/brave-core-nightly.asc
RUN      dnf install -y brave-browser-nightly

RUN      dnf copr enable -y kylegospo/webapp-manager
RUN      dnf install -y webapp-manager

COPY      ./bin/brave-list /usr/bin
COPY      ./share/brave-list.txt /usr/share
RUN      chmod +x /usr/bin/brave-list

RUN      rm -rf /tmp/*
