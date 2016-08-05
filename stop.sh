#!/bin/sh

# Stop Jenkins Standalone
docker rm -f jenkins

# Stop Jenkins in Kubernetes
kubectl delete -f method-3/
