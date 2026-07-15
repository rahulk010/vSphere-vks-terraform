# Provider Variables
variable "vsphere_user" { 
  type = string 
}

variable "vsphere_password" { 
  type      = string 
  sensitive = true 
}

variable "vsphere_server" { 
  type = string 
}

# Infrastructure / Module Variables
variable "datacenter_name" { 
  type = string 
}

variable "supervisor_uuid" { 
  type = string 
}

variable "storage_policy_name" { 
  type = string 
}

variable "content_library_name" { 
  type = string 
}

variable "namespace_name" { 
  type = string 
}

variable "allowed_vm_classes" { 
  type = list(string) 
}

# Cluster Specific Variables
variable "cluster_name" { 
  type = string 
}

variable "k8s_version" { 
  type = string 
}

variable "cluster_class" { 
  type = string 
}
