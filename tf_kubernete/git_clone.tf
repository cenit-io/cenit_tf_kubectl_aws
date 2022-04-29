resource "null_resource" "git_clone" {
  provisioner "local-exec" {
    command = "git clone git@github.com:cenit-io/cenit-kubernetes.git ${var.path_kubernete}"
  }
}