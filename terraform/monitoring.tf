resource "helm_release" "monitoring" {
  name = "monitoring"
  create_namespace = true
  namespace = "monitoring"
  version = "56.6.2"
  chart = "kube-prometheus-stack"
  timeout = 600000
  repository = "https://prometheus-community.github.io/helm-charts"
}
