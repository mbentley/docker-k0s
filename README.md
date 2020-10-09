# mbentley/mke

Docker image for Mirantis Kubernetes Engine based on alpine:latest

```
docker run -d \
  --name mke01 \
  --hostname mke01 \
  -p 6443:6443 \
  --restart unless-stopped \
  --privileged \
  --mount type=bind,source=/lib/modules,destination=/lib/modules,readonly=true \
  --mount type=bind,source=/etc/resolv.conf,destination=/etc/resolv.conf,readonly=true \
  -v `pwd`/mke01.yaml:/mke.yaml:ro \
  -v `pwd`/containerd.toml:/etc/mke/containerd.toml:ro \
  -v mke01_root:/root \
  -v mke01_etc-cni:/etc/cni \
  -v mke01_opt-cni:/opt/cni \
  -v mke01_opt-containerd:/opt/containerd \
  -v mke01_usr-libexec:/usr/libexec \
  -v mke01_var-lib-calico:/var/lib/calico \
  -v mke01_var-lib-cni:/var/lib/cni \
  -v mke01_var-lib-kubelet:/var/lib/kubelet \
  -v mke01_var-lib-mke:/var/lib/mke \
  -v mke01_var-log:/var/log \
  --tmpfs /run \
  mbentley/mke:v0.4.0 \
  server --enable-worker --config /mke.yaml
```
