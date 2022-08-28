module "gke_auth" {
  source = "terraform-google-modules/kubernetes-engine/google//modules/auth"
#   depends_on   = [module.gke]
  project_id   = "${var.project_id}"
  location     = "${var.region}"
  cluster_name = google_container_cluster.primary.name
}

resource "local_file" "kubeconfig" {
  content  = module.gke_auth.kubeconfig_raw
  filename = "kubeconfig"
}

output "cluster_name" {
  description = "Cluster name"
  value       = google_container_cluster.primary.name
}