# Disable admin user
kubectl -n argocd patch configmaps argocd-cm --type merge -p '{"data":{"admin.enabled":"false"}}'

# Delete initial admin secret
kubectl delete secrets argocd-initial-admin-secret -n argocd

# Update status badge to enabled
kubectl -n argocd patch configmaps argocd-cm --type merge -p '{"data":{"statusbadge.enabled":"true"}}'
