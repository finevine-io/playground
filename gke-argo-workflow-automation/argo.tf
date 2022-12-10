provider "helm" {
  kubernetes {
    host                   = "https://${module.gke.endpoint}"
    cluster_ca_certificate = base64decode(module.gke.ca_certificate)
    token                  = data.google_client_config.default.access_token
  }
}

resource "helm_release" "argo_events" {
  name       = "argo-events"

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-events"
}

resource "helm_release" "argo_workflows" {
  name       = "argo-workflows"

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-workflows"
}
