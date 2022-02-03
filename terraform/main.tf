resource "google_cloud_run_service" "soil-moistur-staging" {
  name     = var.name
  location = var.location
  template {
    spec {
      containers {
        image = var.image
      ports {
       container_port  = var.port
       }
       }

    }
    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale"      = var.max_instances
        "autoscaling.knative.dev/minScale" = var.min_instances
              
      }
    }
  }
  traffic {
    percent         = var.traffic_percent
    latest_revision = var.latest_revision
  }
  
}
