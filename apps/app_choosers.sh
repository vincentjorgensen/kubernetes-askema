#!/usr/bin/env bash

function app_choose_infra {
  # Cloud Infrastructure
  app_init_aws

  # K8s infrastructure
  app_init_vault
  app_init_external_dns
  app_init_spire
  app_init_cert_manager
  app_init_keycloak
  app_init_gme
  app_init_glooui
  app_init_istio
}

function app_choose_gateway {
  # Kubernetes Gateway API
  app_init_gateway_api

  # Gateway Controllers
  app_init_traefik
  app_init_kgateway
  app_init_istio_gateway
  app_init_gloo_gateway_v2
  app_init_gloo_gateway_v1
  app_init_gloo_edge
  app_init_gme_workspaces

  # Finalize Gateway Ingress
  app_init_ingress
}

function app_choose_ingresses {
  app_init_eastwest_gateway_api
  app_init_ingress_gateway_api

  # Routing
  app_init_routing
}

function app_choose_apps {
  # Test applications
  app_init_helloworld
  app_init_curl
  app_init_utils
  app_init_netshoot
  app_init_httpbin
}
