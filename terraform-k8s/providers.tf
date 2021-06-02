terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.2.0"
    }
  }
}

provider "kubernetes" {
  config_path = "../k3s-mtc_node-57949.yaml"
}
