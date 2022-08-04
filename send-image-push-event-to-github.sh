#!/usr/bin/env bash
# ----------------------------------------------------------------------------
# Script for testing the Github repository_dispatch github action.
#
# Note: Simulating ACR webhook JSON sent to Github
# ----------------------------------------------------------------------------

token=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
uri=https://api.github.com/orgs/repos/carlnapoli/sre-aks-pipeline/dispatches

payload=$(cat <<EOF
    { "event_type": "on-acr-image-push" }
EOF
)

curl                                             \
  -verbose                                       \
  -X POST                                        \
  -H "Accept: application/vnd.github+json"       \
  -H "Authorization: token $token"               \
  https://api.github.com/repos/carlnapoli/sre-aks-pipeline/dispatches           \
  -d '{"event_type":"on-acr-image-push","client_payload":{"env": "dev", "image":"azure.acr.image.aks:latest"}}'
