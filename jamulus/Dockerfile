FROM cbix/archlinux-builder AS builder
COPY archlinux-proaudio/packages/jamulus /home/builder/jamulus
RUN --mount=type=cache,target=/var/cache/pacman/pkg \
  --mount=type=cache,target=/var/lib/pacman/sync \
  sudo pacman -Sy && MAKEFLAGS="-j4" makepkg -sD /home/builder/jamulus --noconfirm

FROM lopsided/archlinux
RUN --mount=type=cache,target=/var/cache/pacman/pkg  \
  --mount=type=cache,target=/var/lib/pacman/sync \
  --mount=from=builder,target=/mnt \
  pacman -U --noconfirm /mnt/home/builder/packages/jamulus-headless-*.pkg.tar.*
ENTRYPOINT jamulus --nogui --server --multithreading \
  ${DIRECTORYADDRESS:+--directoryaddress "$DIRECTORYADDRESS"} \
  ${SERVERINFO:+--serverinfo "$SERVERINFO"} \
  ${WELCOMEMESSAGE:+--welcomemessage "$WELCOMEMESSAGE"} \
  ${NUMCHANNELS:+--numchannels "$NUMCHANNELS"}
