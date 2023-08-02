#! /usr/bin/bash

# Update argo-cm configmap to create 2 new users - superuser and guest
kubectl -n argocd patch configmaps argocd-cm --type merge -p '{"data":{"accounts.superuser":"login, apiKey","accounts.guest":"login"}}'

# Update argocd-rbac configmap to associate policies with created users
# kubectl -n argocd patch configmaps argocd-cm --type merge -p '{"data":{"policy.csv":{"g, superuser, role:admin","g, guest, role:readonly"},{"policy.default:""role:""''''"}}}'
kubectl -n argocd patch configmaps argocd-rbac-cm --patch-file argocd-rbac-cm-patch.yaml
