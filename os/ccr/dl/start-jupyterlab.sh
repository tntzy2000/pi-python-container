#!/bin/bash

port=${1:-8890}
source activate dev_env
# jupyter lab --ip=0.0.0.0 --port=8890 --no-browser --allow-root --notebook-dir=/root/code
jupyter lab --ip=* --port=$port --no-browser --allow-root --notebook-dir=/root/code