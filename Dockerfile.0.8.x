# rebased/repackaged base image that only updates existing packages
FROM mbentley/alpine:latest
MAINTAINER Matt Bentley <mbentley@mbentley.net>

# install prereqs for k0s
RUN apk add --no-cache coreutils findutils iptables tini

# download the k0s release
RUN apk add --no-cache wget &&\
  wget -O /usr/local/bin/k0s "https://github.com/k0sproject/k0s/releases/download/v0.8.1/k0s-v0.8.1-amd64" &&\
  chmod +x /usr/local/bin/k0s &&\
  apk del wget

# add the entrypoint script
COPY entrypoint.sh /entrypoint.sh

# add the group and user accounts for the services
RUN addgroup -g 500 k0s &&\
  adduser -u 501 -G k0s -H -s /sbin/nologin -D etcd &&\
  adduser -u 502 -G k0s -H -s /sbin/nologin -D kube-apiserver &&\
  adduser -u 503 -G k0s -H -s /sbin/nologin -D kube-scheduler &&\
  adduser -u 504 -G k0s -H -s /sbin/nologin -D kube-controller-manager &&\
  adduser -u 505 -G k0s -H -s /sbin/nologin -D konnectivity-server

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/local/bin/k0s","help"]
