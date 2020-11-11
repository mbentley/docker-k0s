FROM alpine:latest
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN apk add --no-cache coreutils findutils iptables

RUN apk add --no-cache wget &&\
  wget -O /usr/local/bin/k0s "https://github.com/k0sproject/k0s/releases/download/v0.7.0/k0s-v0.7.0-amd64" &&\
  chmod +x /usr/local/bin/k0s &&\
  apk del wget

COPY entrypoint.sh /entrypoint.sh

#RUN addgroup -g 500 k0s &&\
#  adduser -u 501 -G k0s -H -s /sbin/nologin -D etcd &&\
#  adduser -u 502 -G k0s -H -s /sbin/nologin -D kube-apiserver &&\
#  adduser -u 503 -G k0s -H -s /sbin/nologin -D kube-scheduler &&\
#  adduser -u 504 -G k0s -H -s /sbin/nologin -D kube-controller-manager

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/local/bin/k0s","help"]
