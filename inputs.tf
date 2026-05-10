variable "name" {
  description = "Base display name for compute resources."
  type        = string
}

variable "compartment_ocid" {
  description = "Compartment OCID where compute resources will be created."
  type        = string
}

variable "tenancy_ocid" {
  description = "Optional tenancy OCID used for availability domain discovery. When null, compartment_ocid is used."
  type        = string
  default     = null
}

variable "deployment_mode" {
  description = "Compute deployment mode: instance or instance_pool."
  type        = string
  default     = "instance"

  validation {
    condition     = contains(["instance", "instance_pool"], var.deployment_mode)
    error_message = "deployment_mode must be either 'instance' or 'instance_pool'."
  }
}

variable "availability_domain" {
  description = "Availability domain name for the single instance or the default launch template for the instance pool. When null, the first AD in the tenancy is used."
  type        = string
  default     = null
}

variable "fault_domain" {
  description = "Optional fault domain for a single instance deployment."
  type        = string
  default     = null
}

variable "shape" {
  description = "OCI compute shape."
  type        = string
  default     = "VM.Standard.E4.Flex"
}

variable "shape_config" {
  description = "Optional shape config for flexible shapes."
  type = object({
    ocpus         = number
    memory_in_gbs = number
  })
  default = null
}

variable "subnet_id" {
  description = "Subnet OCID for the primary VNIC."
  type        = string
}

variable "assign_public_ip" {
  description = "Assign a public IP on the primary VNIC."
  type        = bool
  default     = false
}

variable "private_ip" {
  description = "Optional private IP for a single instance deployment."
  type        = string
  default     = null
}

variable "hostname_label" {
  description = "Optional hostname label for the primary VNIC."
  type        = string
  default     = null
}

variable "display_name" {
  description = "Optional display name override for the main compute resource."
  type        = string
  default     = null
}

variable "nsg_ids" {
  description = "Optional list of NSG OCIDs to associate with the primary VNIC."
  type        = list(string)
  default     = []
}

variable "ssh_authorized_keys" {
  description = "SSH authorized keys injected into instance metadata. Joined with newlines."
  type        = list(string)
  default     = []
}

variable "user_data" {
  description = "Optional base64-encoded cloud-init or user-data payload."
  type        = string
  default     = null
}

variable "metadata" {
  description = "Additional metadata merged into instance metadata."
  type        = map(string)
  default     = {}
}

variable "extended_metadata" {
  description = "Extended metadata for instance launch details."
  type        = map(string)
  default     = {}
}

variable "source_image_id" {
  description = "Custom image OCID. When null, the module resolves the latest platform image."
  type        = string
  default     = null
}

variable "operating_system" {
  description = "Operating system used when source_image_id is null."
  type        = string
  default     = "Oracle Linux"
}

variable "operating_system_version" {
  description = "Operating system version used when source_image_id is null."
  type        = string
  default     = "9"
}

variable "boot_volume_size_in_gbs" {
  description = "Optional boot volume size in GB."
  type        = number
  default     = null
}

variable "lb_attachment" {
  description = "Optional Load Balancer backend attachment shared by both deployment modes."
  type = object({
    load_balancer_id = string
    backendset_name  = string
    port             = number
    vnic_selection   = optional(string, "PrimaryVnic")
  })
  default = null
}

variable "instance_pool_size" {
  description = "Desired size of the instance pool when deployment_mode is instance_pool and autoscaling is disabled."
  type        = number
  default     = 1
}

variable "placement_configurations" {
  description = "Placement configuration list for the instance pool. When empty, the module uses a single placement based on subnet_id and availability_domain."
  type = list(object({
    availability_domain = string
    primary_subnet_id   = string
    fault_domains       = optional(list(string), [])
  }))
  default = []
}

variable "enable_autoscale" {
  description = "Enable autoscaling for instance_pool deployment mode."
  type        = bool
  default     = false
}

variable "autoscaling_policy_type" {
  description = "Autoscaling policy type for instance pools: threshold or scheduled."
  type        = string
  default     = "threshold"

  validation {
    condition     = contains(["threshold", "scheduled"], var.autoscaling_policy_type)
    error_message = "autoscaling_policy_type must be either 'threshold' or 'scheduled'."
  }
}

variable "autoscaling_min_instances" {
  description = "Minimum number of instances in the autoscaling configuration."
  type        = number
  default     = 1
}

variable "autoscaling_initial_instances" {
  description = "Initial number of instances in the autoscaling configuration."
  type        = number
  default     = 1
}

variable "autoscaling_max_instances" {
  description = "Maximum number of instances in the autoscaling configuration."
  type        = number
  default     = 3
}

variable "autoscaling_cooldown_in_seconds" {
  description = "Cooldown period in seconds for autoscaling actions."
  type        = number
  default     = 300
}

variable "scale_out_cpu_threshold" {
  description = "CPU percentage threshold for scaling out when threshold autoscaling is enabled."
  type        = number
  default     = 70
}

variable "scale_in_cpu_threshold" {
  description = "CPU percentage threshold for scaling in when threshold autoscaling is enabled."
  type        = number
  default     = 25
}

variable "scale_out_step" {
  description = "Number of instances to add on threshold scale-out."
  type        = number
  default     = 1
}

variable "scale_in_step" {
  description = "Number of instances to remove on threshold scale-in."
  type        = number
  default     = 1
}

variable "scheduled_scale_out" {
  description = "Scheduled scale-out policy definition used when autoscaling_policy_type is scheduled."
  type = object({
    expression = string
    timezone   = optional(string, "UTC")
    min        = number
    initial    = number
    max        = number
  })
  default = null
}

variable "scheduled_scale_in" {
  description = "Scheduled scale-in policy definition used when autoscaling_policy_type is scheduled."
  type = object({
    expression = string
    timezone   = optional(string, "UTC")
    min        = number
    initial    = number
    max        = number
  })
  default = null
}

variable "freeform_tags" {
  description = "Freeform tags applied to resources created by the module."
  type        = map(string)
  default     = {}
}

variable "defined_tags" {
  description = "Defined tags applied to resources created by the module."
  type        = map(string)
  default     = {}
}
