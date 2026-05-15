output "deployment_mode" {
  description = "Selected deployment mode."
  value       = var.deployment_mode
}

output "image_id" {
  description = "Resolved image ID used by the deployment."
  value       = local.image_id
}

output "instance_id" {
  description = "Single OCI instance OCID when deployment_mode is instance."
  value       = try(oci_core_instance.this[0].id, null)
}

output "instance_private_ip" {
  description = "Private IP of the single instance."
  value       = try(oci_core_instance.this[0].private_ip, null)
}

output "instance_public_ip" {
  description = "Public IP of the single instance when assigned."
  value       = try(oci_core_instance.this[0].public_ip, null)
}

output "primary_vnic_id" {
  description = "Primary VNIC OCID of the single instance."
  value       = try(data.oci_core_vnic.instance_primary[0].id, null)
}

output "primary_private_ip_id" {
  description = "Primary private IP OCID of the single instance."
  value       = try(data.oci_core_private_ips.instance_primary[0].private_ips[0].id, null)
}

output "instance_configuration_id" {
  description = "OCI instance configuration OCID for instance pool deployments."
  value       = try(oci_core_instance_configuration.this[0].id, null)
}

output "instance_pool_id" {
  description = "OCI instance pool OCID when deployment_mode is instance_pool."
  value       = try(oci_core_instance_pool.this[0].id, null)
}

output "autoscaling_configuration_id" {
  description = "OCI autoscaling configuration OCID when autoscaling is enabled."
  value = try(
    coalesce(
      oci_autoscaling_auto_scaling_configuration.threshold[0].id,
      oci_autoscaling_auto_scaling_configuration.scheduled[0].id
    ),
    null
  )
}

output "lb_backend_id" {
  description = "Backend resource ID created for a single instance attachment."
  value       = try(oci_load_balancer_backend.instance[0].id, null)
}

output "attached_load_balancer" {
  description = "Attached load balancer input echoed back when lb_attachment is configured."
  value       = var.lb_attachment
}
