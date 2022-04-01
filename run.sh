#!/usr/bin/bash -ex

set -ex

export WORKLOAD_TEMPLATE=${PWD}/configmap-scale.yml
export METRICS_PROFILE=${PWD}/metric-profiles/etcdapi.yml
export ALERTS_PROFILE=${PWD}/alert-profiles/etcdapi-alerts.yml
export METADATA_COLLECTION=false
export JOB_TIMEOUT=1800
export WORKLOAD=custom

git clone https://github.com/cloud-bulldozer/e2e-benchmarking.git --depth=1
pushd e2e-benchmarking/workloads/kube-burner

# Trigger workload
./run.sh
