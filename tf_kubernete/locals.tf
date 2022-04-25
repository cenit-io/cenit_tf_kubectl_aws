# Create a local variable for the load balancer name.
locals {
  lb_name = split("-", split(".", kubernetes_service.cenit-cluster-ip-service.status.0.load_balancer.0.ingress.0.hostname).0).0
}