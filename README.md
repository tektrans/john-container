# john-container
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
