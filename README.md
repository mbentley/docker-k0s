# mbentley/k0s

Docker image for Mirantis Kubernetes Engine based on alpine:latest

```
docker run -d \
  --name k0s-01 \
  --hostname k0s-01 \
  -p 6443:6443 \
  --restart unless-stopped \
  --privileged \
  --mount type=bind,source=/lib/modules,destination=/lib/modules,readonly=true \
  --mount type=bind,source=/etc/resolv.conf,destination=/etc/resolv.conf,readonly=true \
  -v ${PWD}/k0s-01.yaml:/k0s.yaml:ro \
  -v ${PWD}/containerd.toml:/etc/k0s/containerd.toml:ro \
  -v k0s-01_root:/root \
  -v k0s-01_etc-cni:/etc/cni \
  -v k0s-01_opt-cni:/opt/cni \
  -v k0s-01_opt-containerd:/opt/containerd \
  -v k0s-01_usr-libexec:/usr/libexec \
  -v k0s-01_var-lib-calico:/var/lib/calico \
  -v k0s-01_var-lib-cni:/var/lib/cni \
  -v k0s-01_var-lib-kubelet:/var/lib/kubelet \
  -v k0s-01_var-lib-k0s:/var/lib/k0s \
  -v k0s-01_var-log:/var/log \
  --tmpfs /run \
  mbentley/k0s:v0.6.0 \
  k0s server --enable-worker --config /k0s.yaml
```
