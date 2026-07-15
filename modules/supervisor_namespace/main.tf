data "vsphere_datacenter" "datacenter" {
  name = var.datacenter_name
}

data "vsphere_storage_policy" "k8s_storage_policy" {
  name = var.storage_policy_name
}


resource "vsphere_namespace" "supervisor_namespace" {
  name = var.namespace_name
  supervisor = var.supervisor_uuid
  vm_service {
    vm_classes = var.allowed_vm_classes
  }
  storage_policies = [
    data.vsphere_storage_policy.k8s_storage_policy.id
  ]
}



