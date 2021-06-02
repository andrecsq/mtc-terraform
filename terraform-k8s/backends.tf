terraform {
  backend "remote" {
    organization = "andrecsq"

    workspaces {
      name = "mtc-k8s"
    }
  }
}
