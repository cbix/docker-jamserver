FROM manjarolinux/build AS builder
USER builder
COPY --chown=builder archlinux-proaudio/packages/jamulus /builder/jamulus
RUN --mount=type=cache,target=/var/cache/pacman/pkg \
  cd /builder/jamulus && MAKEFLAGS="-j4" makepkg -s --noconfirm

FROM manjarolinux/base
RUN --mount=type=cache,target=/var/cache/pacman/pkg  \
  --mount=from=builder,target=/mnt \
  pacman -U --noconfirm /mnt/builder/jamulus/jamulus-headless-*.pkg.tar.*
ENTRYPOINT jamulus --nogui --server --multithreading \
  ${DIRECTORYADDRESS:+--directoryaddress "$DIRECTORYADDRESS"} \
  ${SERVERINFO:+--serverinfo "$SERVERINFO"} \
  ${WELCOMEMESSAGE:+--welcomemessage "$WELCOMEMESSAGE"} \
  ${NUMCHANNELS:+--numchannels "$NUMCHANNELS"}
