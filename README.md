# mbentley/mke

Docker image for Mirantis Kubernetes Engine based on alpine:latest

```
docker run -it \
  --privileged \
  --name mke-1 \
  --hostname mke-1 \
  -v /lib/modules:/lib/modules:ro \
  -p 6443:6443 \
  -v mke-1_usr-libexec:/usr/libexec \
  -v mke-1_run-mke:/run/mke \
  -v mke-1_var-lib-mke:/var/lib/mke \
  -v mke-1_opt-containerd:/opt/containerd \
  -v mke-1_var-lib-kubelet:/var/lib/kubelet \
  -v mke-1_var-log:/var/log \
  mbentley/mke \
  mke server --enable-worker
```
