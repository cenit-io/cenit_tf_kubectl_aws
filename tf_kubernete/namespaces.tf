resource "kubernetes_namespace" "cenit" {
  metadata {
    annotations = {
      name = var.namespace
    }

    labels = {
      app = var.namespace
    }

    name = var.namespace
  }
}
