# kubernetes-askema

Lightweight (citation needed) tool for creating k8s clusters runnng demo infrastructures

Examples:
- Gateway API (Traefik, KGateway, Gloo Gateway V2)
- Istio (Ambient or Sidecar), OSS or Enterprise
- Cert Manager
- Cloud (AWS, AKS, maybe GCP)

For debugging, I use my custom [helloworld
microservice](https://github.com/vincentjorgensen/helloworld-rust-microservice)
and [netshoot](https://github.com/nicolaka/netshoot)

# Requirements

```bash
brew install jinja2 kubectl helm jq yq
```

## istioctl
Some commands require `istioctl` (though I've tried my best to limit them).

```bash
mkdir $HOME/.istioctl/bin
PATH=$HOME/.istioctl/bin:$PATH

istio_ver=1.29
istio_ver_min=1.29.0

curl -L https://istio.io/downloadIstio | ISTIO_VERSION=$istio_ver_min sh -

cp istio-${istio_ver_min}/bin/istioctl $HOME/.istioctl/bin/istioctl-${istio_ver}
```

# Usage

```bash
source ./functions.sh
```
