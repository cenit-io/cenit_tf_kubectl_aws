resource "kubernetes_persistent_volume" "mongo-pv" {
  metadata {
    name = "mongo-pv"
    labels = {
      role = "mongo-pv"
    }
  }
  spec {
    capacity = {
      storage = "5Gi"
    }
    storage_class_name = kubernetes_storage_class.ebs-sc.metadata.0.labels.role
    access_modes       = ["ReadWriteOnce"]

    persistent_volume_source {
      host_path {
        path = "/"
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim" "mongo-pvc" {
  metadata {
    name      = "mongo-pvc"
    namespace = kubernetes_namespace.mongo-namespace.id
    labels = {
      role = "mongo-pvc"
    }
  }
  spec {
    selector {
      match_labels = {
        role = "mongo-pvc"
      }
    }
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "5Gi" #100Gi
      }
    }

    storage_class_name = kubernetes_storage_class.ebs-sc.metadata.0.labels.role
    volume_name        = kubernetes_persistent_volume.mongo-pv.id
  }
}



resource "kubernetes_deployment" "mongo-deployment" {
  metadata {
    name = "mongo-deployment"
    labels = {
      db = "mongo"
    }
    namespace = kubernetes_namespace.mongo-namespace.id
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        db = "mongo"
      }
    }

    template {
      metadata {
        labels = {
          db = "mongo"
        }
      }

      spec {
        volume {
          name = "mongo-storage"
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.mongo-pvc.metadata.0.labels.role
          }
        }
        container {
          name  = "mongodb"
          image = "mongo:3.6"
          /* resources {
            limits = {
              cpu    = "200m"
              memory = "8Gi"
            } */
          image_pull_policy = "Always"


          volume_mount {
            name       = "mongo-storage"
            mount_path = "/data/db"

            read_only = true
          }
          port {
            container_port = 27017
          }

        }
      }
    }
  }
}

resource "kubernetes_service" "mongo-cluster-ip-service" {
  metadata {
    name      = "mongo-cluster-ip-service"
    namespace = kubernetes_namespace.mongo-namespace.id
  }
  spec {
    selector = {
      db = kubernetes_deployment.mongo-deployment.metadata.0.labels.db
    }
    #session_affinity = "ClientIP"
    port {
      port        = 27017
      target_port = 27017
    }
  }
}