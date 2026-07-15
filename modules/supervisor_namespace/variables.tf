variable "datacenter_name" {
  type        = string
  description = "The name of the target vSphere Datacenter."
}

variable "storage_policy_name" {
  type        = string
  description = "The name of the storage policy."
}

variable "content_library_name" {
  type        = string
  description = "The name of the Subscribed Content Library holding vkr images."
}

variable "namespace_name" {
  type        = string
  description = "The name of the Supervisor Namespace to create."
}

variable "supervisor_uuid" {
  type        = string
  description = "The validated Supervisor UUID string from vCenter."
}

variable "allowed_vm_classes" {
  type        = list(string)
  description = "List of VM configuration sizing classes allowed in this namespace."
}

