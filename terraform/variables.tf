variable "name"{
  default="soil-moisture-staging"
}
variable "image"{
    default="gcr.io/liquid-anchor-192605/staging/soil-moisture@sha256:4caa5c76afd2a7634afbe63ec509cff81695151b5825c69e1638928c9cd087b3"
}


variable "port"{
    default=5000
    type=number
}
variable "location"{
    default="asia-south1"
}

variable "max_instances"{
    default="3"
}

variable "min_instances"{
    default="1"
}

variable "traffic_percent"{
    default=100
    type=number
}

variable "latest_revision"{
    type=bool
     default=true
}
