provider "kubernetes-alpha" {
  config_path = "~/.kube/config" // path to kubeconfig
}

module "argocd" {
  source    = "aareet/argocd/kubernetes"
  namespace = "argocd"
}

# resource "kubernetes_service" "kubsvc" {
#   metadata {
#     name = "argocd-server"
#     namespace = "argocd"
#   }
#   spec {
#     selector = {
#       app = kubernetes_pod.kubsvc.metadata.0.labels.app
#     }
#     session_affinity = "ClientIP"
#     port {
#       port        = 80
#       target_port = 8080
#     }

#     type = "LoadBalancer"
#   }
# }
