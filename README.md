# Express app deployed with supporting helm charts
## Chart Features
- This includes an express app deployed as a helm chart along with other helm charts to support it:
- [argocd](https://argoproj.github.io/argo-helm)
  - add explanation here
- [cert-manager](https://charts.jetstack.io)
- [ingress-nginx](https://github.com/kubernetes/ingress-nginx)
- [sealed-secrets](https://github.com/bitnami-labs/sealed-secrets)
- [express-app](https://github.com/Lisa-Stats/express-app)

## Implementation
- `argoCD` is first installed as a helm chart
- An `argocd Project` is installed from within the `argocd-templates` folder
- An `ApplicationSet` is then deployed with `git` and `list` generators
  - The `git` generator watches this repo and automatically creates `Applications` from the `charts/` directory
  - The `list` generator generates the parameters so they can be passed into the template
- It is possible to login to the UI via `argocd.lstats.me` with read-only permissions
  - `username:` `guest`
  - `password:` `guest123`

## App
- There is an `Ingress` resource for the app at `express.lstats.me`
  - However, it is only a `Hello World!` to show that it is up and working :partying_face:

## App Health
`Cert-Manager` - [![App Status](https://argocd.lstats.me/api/badge?name=cert-manager-testing&revision=true)](https://argocd.lstats.me/applications/cert-manager-testing) \
`Ingress-Nginx` - [![App Status](https://argocd.lstats.me/api/badge?name=ingress-nginx-testing&revision=true)](https://argocd.lstats.me/applications/ingress-nginx-testing) \
`Sealed-Secrets` - [![App Status](https://argocd.lstats.me/api/badge?name=sealed-secrets-testing&revision=true)](https://argocd.lstats.me/applications/sealed-secrets-testing) \
`Express-App` - [![App Status](https://argocd.lstats.me/api/badge?name=sealed-secrets-testing&revision=true)](https://argocd.lstats.me/applications/express-app-testing)
