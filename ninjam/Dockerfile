FROM alpine
RUN --mount=source=./repo,target=/mnt/ find /mnt && apk -X /mnt add ninjam-server
ENTRYPOINT ninjamsrv /etc/ninjam.cfg
