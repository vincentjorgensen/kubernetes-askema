#!/usr/bin/env bash
function app_init_kgateway {
  if $KGATEWAY_ENABLED; then
    echo '# '"$0"
    $ITER_MC_1 exec_kgateway_crds
    $ITER_MC_1 exec_kgateway_control_plane
  fi
}

function exec_kgateway_crds {
  if is_create_mode; then
    # shellcheck disable=SC2086
    $DRY_RUN helm upgrade --install kgateway-crds "$KGATEWAY_CRDS_HELM_REPO"   \
    --version "$KGATEWAY_HELM_VER"                                             \
    --kube-context="$KSA_CONTEXT"                                              \
    --namespace "$KGATEWAY_NAMESPACE"                                          \
    --create-namespace                                                         \
    --wait
  else
    $DRY_RUN helm uninstall kgateway-crds                                      \
    --kube-context="$KSA_CONTEXT"                                              \
    --namespace "$KGATEWAY_NAMESPACE"
  fi
}

function exec_kgateway_control_plane {
  local _manifest="$MANIFESTS/helm.kgateway.${KSA_CLUSTER}.yaml"
  local _template="$TEMPLATES"/kgateway/helm.values.yaml.j2

  _make_manifest "$_template" > "$_manifest"

  if is_create_mode; then
    # shellcheck disable=SC2086
    $DRY_RUN helm upgrade --install kgateway "$KGATEWAY_HELM_REPO"             \
    --version "$KGATEWAY_HELM_VER"                                             \
    --kube-context="$KSA_CONTEXT"                                              \
    --namespace "$KGATEWAY_NAMESPACE"                                          \
    --values "$_manifest"                                                      \
    --wait
  else
    $DRY_RUN helm uninstall kgateway                                           \
    --kube-context="$KSA_CONTEXT"                                              \
    --namespace "$KGATEWAY_NAMESPACE"
  fi

  if is_create_mode; then
    $DRY_RUN kubectl wait                                                      \
    --context="$KSA_CONTEXT"                                                   \
    --namespace "$KGATEWAY_NAMESPACE"                                          \
    --for=condition=Ready pods --all
  fi
}

function exec_kgateway_keycloak_secret {
  create_keycloak_secret "$KGATEWAY_NAMESPACE"
}

