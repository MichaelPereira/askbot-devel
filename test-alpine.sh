#!/bin/sh
docker run --rm -it -v $(pwd):/askbot askbot:alpine sh run_tests_in_docker.sh
