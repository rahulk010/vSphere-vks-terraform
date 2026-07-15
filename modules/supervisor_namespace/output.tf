output "namespace_id" {
  value = vsphere_namespace.supervisor_namespace.id
  description = "supervisor namespace ID"
}

output "namespace_name" {
  value = vsphere_namespace.supervisor_namespace.name
  description = "supervisor namespace name"
}
