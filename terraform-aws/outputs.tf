# root

output "load_balancer_endpoint" {
  value = module.loadbalancing.lb_endpoint
}

output "instances" {
  value = module.compute.instances
}

output "kubeconfig" {
  value = [for i in keys(module.compute.instances) : "export KUBECONFIG=../k3s-${i}.yaml"]
}