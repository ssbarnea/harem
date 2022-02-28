#!/bin/bash
set -euxo pipefail
docker stop watchtower && docker rm watchtower || true
docker run --rm -it \
    --name watchtower \
    -v /var/run/docker.sock:/var/run/docker.sock \
    containrrr/watchtower \
    --run-once
