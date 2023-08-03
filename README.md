# Express app deployed with supporting helm charts
## Chart Features
- This includes an Express Node.js app deployed as a helm chart along with other helm charts to support it:
- [Argocd](https://argoproj.github.io/argo-helm)
  - A gitops continuous delivery tool for kubernetes that watches a repository and updates the `Kubernetes` cluster accordingly
- [Cert-manager](https://charts.jetstack.io)
  - Adds certificates and certificate issuers as resource types in `Kubernetes` clusters and simplifies the process of obtaining, renewing and using those certificates
- [Ingress-nginx](https://github.com/kubernetes/ingress-nginx)
  - An ingress controller that is needed in order for the `Ingress` resources to work
- [Sealed-secrets](https://github.com/bitnami-labs/sealed-secrets)
  - A Kubernetes controller and tool for one-way encrypted `Secrets`
- [Express-app](https://github.com/Lisa-Stats/express-app)
  - Application to deploy

## Implementation
- `ArgoCD` is first installed as a helm chart
- An `Argocd Project` is installed from within the `argocd-templates` folder
- An `ApplicationSet` is then deployed with `git` and `list` generators
  - The `git` generator watches this repo and automatically creates `Applications` from the `charts/` directory
  - The `list` generator generates the parameters so they can be passed into the template
- It is possible to login to the UI via `argocd.lstats.me` with read-only permissions
  - `username:` `guest`
  - `password:` `guest123`

## CI/CD
### CI
- There is a CI pipeline from the [express-app](https://github.com/Lisa-Stats/express-app) repo where the app code originates from
  - The pipeline does 3 things on a push to `main`:
    - Tests app
    - Builds and deploys the image to the container registry in DigitalOcean
    - Creates a PR with an update to the `.image.tag` value in the `express-app` chart
### CD
- `ArgoCD` polls this repo and will automatically pull in changes when there are updates

## App
- There is an `Ingress` resource for the app at `express.lstats.me`
  - However, it is only a `Hello World!` to show that it is up and working :partying_face:

## Infrastructure
- All infrastructure is created with terraform from the [tf-express-app](https://github.com/Lisa-Stats/tf-express-app) repo

## App Health
`Cert-Manager` - [![App Status](https://argocd.lstats.me/api/badge?name=cert-manager-testing&revision=true)](https://argocd.lstats.me/applications/cert-manager-testing) \
`Ingress-Nginx` - [![App Status](https://argocd.lstats.me/api/badge?name=ingress-nginx-testing&revision=true)](https://argocd.lstats.me/applications/ingress-nginx-testing) \
`Sealed-Secrets` - [![App Status](https://argocd.lstats.me/api/badge?name=sealed-secrets-testing&revision=true)](https://argocd.lstats.me/applications/sealed-secrets-testing) \
`Express-App` - [![App Status](https://argocd.lstats.me/api/badge?name=sealed-secrets-testing&revision=true)](https://argocd.lstats.me/applications/express-app-testing)
