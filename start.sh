#!/bin/sh

# Run Jenkins Standalone
sh method-2/run-ci.sh

# Run Jenkins in Kubernetes
kubectl create -f method-3/
