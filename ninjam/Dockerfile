FROM cbix/archlinux-builder AS builder
COPY archlinux-proaudio/packages/ninjam-server /home/builder/ninjam-server
RUN --mount=type=cache,target=/var/cache/pacman/pkg \
  --mount=type=cache,target=/var/lib/pacman/sync \
  sudo pacman -Sy && MAKEFLAGS="-j4" makepkg -sD /home/builder/ninjam-server --noconfirm

FROM lopsided/archlinux
RUN --mount=type=cache,target=/var/cache/pacman/pkg  \
  --mount=type=cache,target=/var/lib/pacman/sync \
  --mount=from=builder,target=/mnt \
  pacman -U --noconfirm /mnt/home/builder/packages/ninjam-server-*.pkg.tar.*
ENTRYPOINT ninjamsrv /etc/ninjam.cfg
