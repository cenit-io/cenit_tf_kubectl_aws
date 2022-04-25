resource "kubernetes_deployment" "cenit-deployment-backend" {
  metadata {
    name = "cenit-deployment-backend"
    labels = {
      platform = "cenit-backend"
    }
    namespace = kubernetes_namespace.cenit.id
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        platform = "cenit-backend"
      }
    }

    template {
      metadata {
        labels = {
          platform = "cenit-backend"
        }
      }

      spec {
        volume {
          name = "host-docker-socket"
          host_path {
            path = "/var/run/docker.sock"
          }
        }
        volume {
          name = "host-volume"
          host_path {
            path = "/"
          }
        }

        image_pull_secrets {
          name = "regcred"
        }
        container {
          image = "cenitgroup/cenitio:latest"
          #image = "wordpress:php7.1-apache"
          name = "cenit-backend"

          image_pull_policy = "Always"

          /* resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
          } */

          volume_mount {
            name       = "host-docker-socket"
            mount_path = "/var/run/docker.sock"

            read_only = true
          }

          volume_mount {
            name       = "host-volume"
            mount_path = "/host"
            read_only  = true
          }

          security_context {
            capabilities {
              add = ["SYS_PTRACE"]
            }
          }

          #command = ["bundle", "exec", "unicorn", "-c", "config/unicorn.rb"]
          env {
            name  = "NRIA_LICENSE_KEY"
            value = ""
          }
          env {
            name  = "SKIP_DB_INITIALIZATION"
            value = false
          }
          env {
            name  = "SKIP_RABBIT_MQ"
            value = false
          }
          env {
            name  = "SCHEDULER_LOOKUP_INTERVAL"
            value = ""
          }
          env {
            name  = "UNICORN_WORKERS"
            value = ""
          }
          env {
            name  = "MAXIMUM_UNICORN_CONSUMERS"
            value = ""
          }
          env {
            name  = "LOOKUP_SCHEDULER_OFF"
            value = ""
          }
          env {
            name  = "LOAD_DELAYED_MESSAGES_ON_START"
            value = ""
          }
          env {
            name  = "REDIS_HOST"
            value = "redis-cluster-ip-service"
          }
          env {
            name  = "AWS_S3_REGION"
            value = ""
          }

          env {
            name  = "AWS_S3_BUCKET_PREFIX"
            value = ""
          }
          env {
            name  = "AWS_ACCESS_KEY_ID"
            value = ""
          }
          env {
            name  = "AWS_SECRET_ACCESS_KEY"
            value = ""
          }
          env {
            name  = "DEFAULT_FILE_STORE"
            value = ""
          }
          env {
            name  = "HOMEPAGE"
            value = ""
          }
          env {
            name  = "DOCS_URL"
            value = ""
          }
          env {
            name  = "TENANT_CREATION_DISABLED"
            value = ""
          }
          env {
            name  = "GMAIL_USERNAME"
            value = ""
          }
          env {
            name  = "GMAIL_PASSWORD"
            value = ""
          }
          env {
            name  = "MAIL_DOMAIN"
            value = ""
          }
          env {
            name  = "HOST"
            value = ""
          }
          /*  env {
            name  = "RABBITMQ_BIGWIG_TX_URL"
            value = "amqp://<USER>:<PASSWORD>@rabbitmq-cluster-ip-service/<VHOST>"
          } */

        }
      }
    }
  }
}

resource "kubernetes_deployment" "cenit-deployment-frontend" {
  metadata {
    name = "cenit-deployment-frontend"
    labels = {
      platform = "cenit-frontend"
    }
    namespace = kubernetes_namespace.cenit.id
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        platform = "cenit-frontend"
      }
    }

    template {
      metadata {
        labels = {
          platform = "cenit-frontend"
        }
      }

      spec {
        volume {
          name = "host-docker-socket"
          host_path {
            path = "/var/run/docker.sock"
          }
        }
        volume {
          name = "host-volume"
          host_path {
            path = "/"
          }
        }

        image_pull_secrets {
          name = "regcred"
        }
        container {
          image = "cenitgroup/cenitio:frontend"
          #image = "wordpress:php7.1-apache"
          name = "cenit-frontend"

          image_pull_policy = "Always"

          /* resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
          } */

          volume_mount {
            name       = "host-docker-socket"
            mount_path = "/var/run/docker.sock"

            read_only = true
          }

          volume_mount {
            name       = "host-volume"
            mount_path = "/host"
            read_only  = true
          }

          security_context {
            capabilities {
              add = ["SYS_PTRACE"]
            }
          }

          #command = ["bundle", "exec", "unicorn", "-c", "config/unicorn.rb"]
          env {
            name  = "NRIA_LICENSE_KEY"
            value = ""
          }
          env {
            name  = "ENABLE_RERECAPTCHA"
            value = ""
          }
          env {
            name  = "MAXIMUM_UNICORN_CONSUMERS"
            value = ""
          }
          env {
            name  = "BASE_MULTIPLIER_ACTIVE_TASKS"
            value = ""
          }
          env {
            name  = "SCHEDULER_LOOKUP_INTERVAL"
            value = ""
          }
          env {
            name  = "UNICORN_WORKERS"
            value = ""
          }
          env {
            name  = "LOOKUP_SCHEDULER_OFF"
            value = ""
          }
          env {
            name  = "DELAY_TASKS"
            value = ""
          }
          env {
            name  = "REDIS_HOST"
            value = "redis-cluster-ip-service"
          }
          env {
            name  = "AWS_S3_REGION"
            value = ""
          }
          env {
            name  = "AWS_S3_BUCKET_PREFIX"
            value = ""
          }
          env {
            name  = "AWS_ACCESS_KEY_ID"
            value = ""
          }
          env {
            name  = "AWS_SECRET_ACCESS_KEY"
            value = ""
          }
          env {
            name  = "DEFAULT_FILE_STORE"
            value = ""
          }
          env {
            name  = "HOMEPAGE"
            value = ""
          }
          env {
            name  = "DOCS_URL"
            value = ""
          }
          env {
            name  = "TENANT_CREATION_DISABLED"
            value = ""
          }
          env {
            name  = "GMAIL_USERNAME"
            value = ""
          }
          env {
            name  = "GMAIL_PASSWORD"
            value = ""
          }
          env {
            name  = "MAIL_DOMAIN"
            value = ""
          }
          env {
            name  = "HOST"
            value = ""
          }

          port {
            container_port = 80
          }

        }
      }
    }
  }
}

resource "kubernetes_service" "cenit-cluster-ip-service" {
  metadata {
    name      = "cenit-cluster-ip-service"
    namespace = kubernetes_namespace.cenit.id
  }
  spec {
    selector = {
      platform = kubernetes_deployment.cenit-deployment-frontend.metadata.0.labels.platform
    }
    #session_affinity = "ClientIP"
    port {
      port        = 8080
      target_port = 80
    }

    type = "LoadBalancer"
  }
}



# obtener las variables de entorno
#falta servicio para la conexion de frontend con backend
#falta el acceso a las imagenes docker
#falta hacer el ingress con el nombre del dominio