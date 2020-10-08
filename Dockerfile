FROM alpine:latest
MAINTAINER Matt Bentley <mbentley@mbentley.net>

COPY mke-v0.4.0-amd64 /usr/local/bin/mke

RUN apk add --no-cache coreutils findutils iptables

ENTRYPOINT ["/usr/local/bin/mke"]
CMD ["help"]
