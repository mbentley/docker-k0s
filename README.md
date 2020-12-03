# mbentley/k0s

Docker image for [k0s - Zero Friction Kubernetes](https://github.com/k0sproject/k0s)

## Tags for `amd64`

* `latest`, `0.8` - k0s 0.8.x (currently 0.8.1) - [Dockerfile.0.8.x](Dockerfile.0.8.x)
* `0.7` - k0s 0.7.x (currently 0.7.0) - [Dockerfile.0.7.x](Dockerfile.0.7.x)

## Example usage

```
docker run -d \
  --name k0s-01 \
  --hostname k0s-01 \
  -p 6443:6443 \
  --restart unless-stopped \
  --privileged \
  --mount type=bind,source=/lib/modules,destination=/lib/modules,readonly=true \
  --mount type=bind,source=/etc/resolv.conf,destination=/etc/resolv.conf,readonly=true \
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
  mbentley/k0s:0.8 \
  k0s server --enable-worker
```

## Cleanup

```
docker stop k0s-01
docker rm k0s-01
docker volume prune
```

## Example advanced usage

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
  mbentley/k0s:0.8 \
  k0s server --enable-worker --config /k0s.yaml
```

## get kubeconfig

```
docker exec -it k0s-01 cat /var/lib/k0s/pki/admin.conf
```
