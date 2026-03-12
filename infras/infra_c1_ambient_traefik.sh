#!/usr/bin/env bash
# K8s Clusters
export KSA_CLUSTER=cluster1
export KSA_CONTEXT=$KSA_CLUSTER
export KSA_NETWORK=$KSA_CLUSTER

# Infrastructure
export EXTERNAL_DNS_ENABLED=true
export AMBIENT_ENABLED=true

# Gateway
export TRAEFIK_ENABLED=true

# Test Apps
export REMOTE_HELLOWORLD_ENABLED=true
export HELLOWORLD_ENABLED=true
export NETSHOOT_ENABLED=true
