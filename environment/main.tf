# 1. Instantiate the Namespace using your template (Completely variable-driven)
module "tkg_namespace" {
  source = "../modules/supervisor_namespace"

  namespace_name       = var.namespace_name
  supervisor_uuid      = var.supervisor_uuid
  datacenter_name      = var.datacenter_name
  storage_policy_name  = var.storage_policy_name
  content_library_name = var.content_library_name
  allowed_vm_classes   = var.allowed_vm_classes
}

# 2. Deploy the VKS Cluster using environment variables
resource "kubernetes_manifest" "vks_workload_cluster" {
  depends_on = [module.tkg_namespace]

  manifest = {
    apiVersion = "cluster.x-k8s.io/v1beta1"
    kind       = "Cluster"
    metadata = {
      name      = var.cluster_name
      namespace = module.tkg_namespace.namespace_name
    }
    spec = {
      clusterNetwork = {
        pods          = { cidrBlocks = ["192.168.0.0/16"] }
        services      = { cidrBlocks = ["198.51.100.0/12"] }
        serviceDomain = "cluster.local"
      }
      topology = {
        class   = var.cluster_class
        version = var.k8s_version

        # 🔑 Every element in this list now shares an identical structural data type
        variables = [
          {
            name  = "vmClass"
            value = "best-effort-medium"
          },
          {
            name  = "storageClass"
            value = lower(replace(var.storage_policy_name, " ", "-"))
          },
          {
            name  = "vsphereOptions"
            value = {
              persistentVolumes = {
                defaultStorageClass = lower(replace(var.storage_policy_name, " ", "-"))
              }
            }
          }
        ]

        controlPlane = { replicas = 1 }
        workers = {
          machineDeployments = [
            {
              class    = "node-pool"
              name     = "np01"
              replicas = 2
              variables = {
                overrides = [
                  {
                    name  = "vmClass"
                    value = "best-effort-large"
                  }
                ]
              }
            }
          ]
        }
      }
    }
  }
}
