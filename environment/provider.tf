terraform {
  required_providers {
    vsphere = {
      source = "vmware/vsphere"
      version = "~> 2.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}


provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

provider "kubernetes" {
  config_path = "~/.kube/config"
  config_context = "mgmt-cluster"
}
