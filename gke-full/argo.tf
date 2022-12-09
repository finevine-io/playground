provider "helm" {
  kubernetes {
    host                   = "https://${module.gke.endpoint}"
    cluster_ca_certificate = base64decode(module.gke.ca_certificate)
    token                  = data.google_client_config.default.access_token
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
}
