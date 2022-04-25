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
resource "kubernetes_namespace" "mongo-namespace" {
  metadata {
    annotations = {
      name = var.mongo-namespace
    }

    labels = {
      app = var.mongo-namespace
    }

    name = var.mongo-namespace
  }
}