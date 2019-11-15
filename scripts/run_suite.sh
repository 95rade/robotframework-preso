#!/usr/bin/env bash
set -e

CMD="robot --console verbose --outputdir /reports /tests"

echo ${CMD}

``${CMD}``
