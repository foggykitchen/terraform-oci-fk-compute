output "instance_id" {
  value = module.compute.instance_id
}

output "instance_private_ip" {
  value = module.compute.instance_private_ip
}

output "instance_public_ip" {
  value = module.compute.instance_public_ip
}

output "vcn_id" {
  value = module.vcn.vcn_id
}
