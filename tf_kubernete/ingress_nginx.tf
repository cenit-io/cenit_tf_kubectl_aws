 
/* resource "helm_release" "ingress_nginx" {
  name       = "ingress-nginx"
  namespace  = kubernetes_namespace.cenit.id
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  #version    = "3.30.0"

  set {
    name  = "controller.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "defaultBackend.enabled"
    value = true
  }

  set {
    name  = "controller.ingressClassResource.name"
    value = "nginx"
  }
  set {
    name  = "controller.ingressClassByName"
    value = true
  }

} */
