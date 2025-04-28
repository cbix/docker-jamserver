# docker-jamserver

[![Build Status](https://ci.cbix.de/api/badges/cbix/docker-jamserver/status.svg)](https://ci.cbix.de/cbix/docker-jamserver)

A simple docker compose specification for running an online jamming server with:

- [Jamulus](https://jamulus.io/)
- [Ninjam](https://cockos.com/ninjam/)

## Setup

```
cp compose.config.yml compose.override.yml # edit to configure
cp ninjam/ninjam.cfg.example ninjam/ninam.cfg # edit to configure
docker compose pull # or build
docker compose up -d
```
