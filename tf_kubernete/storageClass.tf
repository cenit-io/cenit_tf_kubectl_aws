resource "kubernetes_storage_class" "ebs-sc" {
  metadata {
    name = "ebs-sc"
    labels = {
      role = "ebs-sc"
    }
  }
  storage_provisioner = "ebs.csi.aws.com"
  volume_binding_mode = "WaitForFirstConsumer"
  reclaim_policy      = "Retain"
  /* parameters = {
    type = "pd-standard"
  }
  mount_options = ["file_mode=0700", "dir_mode=0777", "mfsymlinks", "uid=1000", "gid=1000", "nobrl", "cache=none"]
 */
}

