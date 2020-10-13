FROM alpine:latest
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN apk add --no-cache coreutils findutils iptables

COPY mke-v0.5.0-amd64 /usr/local/bin/mke

ENTRYPOINT ["/usr/local/bin/mke"]
CMD ["help"]
