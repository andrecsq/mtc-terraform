terraform {
  backend "remote" {
    organization = "andrecsq"

    workspaces {
      name = "dev"
    }
  }
}