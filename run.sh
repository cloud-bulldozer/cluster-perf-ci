#!/usr/bin/bash -ex

set -ex

prom_url=https://$(oc get route -n openshift-monitoring prometheus-k8s  -o jsonpath="{.spec.host}")
token=$(oc sa get-token -n openshift-monitoring prometheus-k8s)

curl -L https://github.com/cloud-bulldozer/kube-burner/releases/download/v0.15.4/kube-burner-0.15.4-Linux-x86_64.tar.gz | tar xz
# Trigger workload
./kube-burner init -c ${PWD}/configmap-scale.yml -m ${PWD}/metric-profiles/etcdapi.yml -a ${PWD}/alert-profiles/etcdapi-alerts.yml -u ${prom_url} -t ${token}
