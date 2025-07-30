# john-container

[![Static Badge](https://img.shields.io/badge/containerized_by-tektrans-blue)](https://tektrans.id)


Container for john the ripper, based on kalilinux/kali-roling.

## How to use
Using docker:
```bash
docker run --rm -ti --tz Asia/Jakarta -v ${PWD}/pass.txt:/pass.txt ghcr.io/tektrans/john:latest
```

Using podman:
```bash
podman run --rm -ti --tz Asia/Jakarta -v ${PWD}/pass.txt:/pass.txt ghcr.io/tektrans/john:latest
```
