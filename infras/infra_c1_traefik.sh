#!/usr/bin/env bash
# K8s Clusters
export KSA_CLUSTER=cluster1
export KSA_CONTEXT=$KSA_CLUSTER
export KSA_NETWORK=$KSA_CLUSTER

# Gateway
export TRAEFIK_ENABLED=true

# Test Apps
export HELLOWORLD_ENABLED=true
export REMOTE_HELLOWORLD_ENABLED=true
export NETSHOOT_ENABLED=true
