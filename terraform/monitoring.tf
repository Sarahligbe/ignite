resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}

resource "helm_release" "monitoring" {
  name = "monitoring"
  namespace = kubernetes_namespace.monitoring.metadata[0].name
  version = "56.6.2"
  chart = "kube-prometheus-stack"
  timeout = 1000
  repository = "https://prometheus-community.github.io/helm-charts"
}