#!/usr/bin/env bash
function app_init_routing {
  echo '# '"$0"
  $ITER_MC_1 exec_helloworld_routing
  $ITER_MC_1 exec_httpbin_routing
}
