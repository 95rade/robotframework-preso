#!/usr/bin/env bash

docker run --rm \
           -v "$PWD/tests":/tests \
           -v "$PWD/scripts":/scripts \
           -v "$PWD/reports":/reports \
           --security-opt seccomp:unconfined \
           --shm-size "256M" \
           robot-framework-docker
