FROM manjarolinux/build AS builder
USER builder
COPY --chown=builder archlinux-proaudio/packages/ninjam-server /builder/ninjam-server
RUN --mount=type=cache,target=/var/cache/pacman/pkg \
  cd /builder/ninjam-server && MAKEFLAGS="-j4" makepkg -s --noconfirm

FROM manjarolinux/base
RUN --mount=type=cache,target=/var/cache/pacman/pkg  \
  --mount=from=builder,target=/mnt \
  pacman -U --noconfirm /mnt/builder/ninjam-server/ninjam-server-*.pkg.tar.*
ENTRYPOINT ninjamsrv /etc/ninjam.cfg
