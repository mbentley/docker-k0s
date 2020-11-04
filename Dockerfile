FROM alpine:latest
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN apk add --no-cache coreutils findutils iptables

RUN apk add --no-cache wget &&\
  wget -O /usr/local/bin/mke "https://github.com/k0sproject/k0s/releases/download/v0.6.0/mke-v0.6.0-amd64" &&\
  chmod +x /usr/local/bin/mke &&\
  apk del wget

COPY entrypoint.sh /entrypoint.sh

#RUN addgroup -g 500 mke &&\
#  adduser -u 501 -G mke -H -s /sbin/nologin -D etcd &&\
#  adduser -u 502 -G mke -H -s /sbin/nologin -D kube-apiserver &&\
#  adduser -u 503 -G mke -H -s /sbin/nologin -D kube-scheduler &&\
#  adduser -u 504 -G mke -H -s /sbin/nologin -D kube-controller-manager

ENTRYPOINT ["/entrypoint.sh","/usr/local/bin/mke"]
CMD ["help"]
