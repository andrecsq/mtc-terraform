# compute

output "instances" {
  value = { for i in aws_instance.mtc_node[*] :
  i.tags.Name => "${i.public_ip}:${aws_lb_target_group_attachment.mtc_tg_attach[0].port}" }
}