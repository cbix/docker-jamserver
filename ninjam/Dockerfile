FROM alpine
RUN --mount=source=repo,target=/mnt/ apk -X /mnt/repo add ninjam-server
ENTRYPOINT ninjamsrv /etc/ninjam.cfg
