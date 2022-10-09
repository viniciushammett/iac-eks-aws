resource "kubernetes_deployment" "Django-API" {
  metadata {
    name = "django-api"
    labels = {
      name = "django"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        name = "django"
      }
    }

    template {
      metadata {
        labels = {
          name = "django"
        }
      }

      spec {
        container {
          image = "539638198221.dkr.ecr.us-east-1.amazonaws.com/producao:v1"
          name  = "django"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/clientes/"
              port = 8000
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}