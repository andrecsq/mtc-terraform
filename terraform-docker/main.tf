locals {
  deployment = {
    nodered = {
      image           = var.image["nodered"][terraform.workspace]
      int             = 1880
      ext             = var.ext_port["nodered"][terraform.workspace]
      container_count = length(var.ext_port["nodered"][terraform.workspace])
      volumes = [
        { container_path_each = "/data" },
      ]
    }
    influxdb = {
      image           = var.image["influxdb"][terraform.workspace]
      int             = 8086
      ext             = var.ext_port["influxdb"][terraform.workspace]
      container_count = length(var.ext_port["influxdb"][terraform.workspace])
      volumes = [
        { container_path_each = "/var/lib/influxdb" },
      ]
    }
    grafana = {
      image           = var.image["grafana"][terraform.workspace]
      int             = 3000
      ext             = var.ext_port["grafana"][terraform.workspace]
      container_count = length(var.ext_port["grafana"][terraform.workspace])
      volumes = [
        { container_path_each = "/var/lib/grafana" },
        { container_path_each = "/etc/grafana" },
      ]
    }
  }
}


module "image" {
  source   = "./image"
  for_each = local.deployment
  image_in = each.value.image
}


module "container" {
  source      = "./container"
  for_each    = local.deployment
  count_in    = each.value.container_count
  name_in     = each.key
  image_in    = module.image[each.key].image_out
  int_port_in = each.value.int
  ext_port_in = each.value.ext
  volumes_in  = each.value.volumes
}



