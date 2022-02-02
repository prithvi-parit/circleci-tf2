provider "google" {
  project     = "liquid-anchor-192605"
  region      = "asia-south1"
  credentials = "sec_gcp.json"
}
resource "google_cloud_run_service" "soil-moistur-staging2" {
  name     = "soil-moisture-staging2"
  location = "asia-south1"
  template {
    spec {
      containers {
        image = "gcr.io/liquid-anchor-192605/staging/soil-moisture@sha256:4caa5c76afd2a7634afbe63ec509cff81695151b5825c69e1638928c9cd087b3"
      ports {
       container_port  = 5000
       }
       }

    }
    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale"      = "3"
        "autoscaling.knative.dev/minScale" = "1"
              
      }
    }
  }
  traffic {
    percent         = 100
    latest_revision = true
  }
  
}
