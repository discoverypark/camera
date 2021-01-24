#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
if [[ "$@" == *"--jpeg"* ]]; then
	bash $DIR/installer/lib-jpeg.sh $DIR
fi
if [[ "$@" == *"--png"* ]]; then
	bash $DIR/installer/lib-png.sh $DIR
fi