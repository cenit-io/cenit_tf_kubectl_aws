resource "null_resource" "deploy_kubernete" {
  provisioner "local-exec" {
    command = "kubectl --kubeconfig=${var.path_kubectl} -f ${var.path_kubernete}"
  }
}