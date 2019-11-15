#!/usr/bin/env bash

docker run --rm \
           -v "$PWD/suites":/tests \
           -v "$PWD/scripts":/scripts \
           -v "$PWD/reports":/reports \
           --security-opt seccomp:unconfined \
           --shm-size "256M" \
           ypasmk/robot-framework
