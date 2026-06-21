packer {
  required_plugins {
    azure = {
      source  = "github.com/hashicorp/azure"
      version = "~> 2"
    }
  }
}

source "azure-arm" "rhel9" {
  use_azure_cli_auth = true

  subscription_id = "cb940b9c-fcd9-462e-b329-a35b66d4c075"

  managed_image_resource_group_name = "rg-golden-images-onyinye"
  managed_image_name                = "rhel9-cis-packer-temp-102"

  os_type         = "Linux"
  image_publisher = "RedHat"
  image_offer     = "RHEL"
  image_sku = "9_8-gen2"
  location        = "East US"
  vm_size         = "Standard_D2s_v3"

  shared_image_gallery_destination {
    resource_group       = "rg-golden-images-onyinye"
    gallery_name         = "gal_golden_images_onyinye"
    image_name           = "rhel9-cis"
    image_version        = "1.0.2"
    replication_regions  = ["East US"]
    storage_account_type = "Premium_LRS"
  }
}

build {
  name    = "rhel9-cis-golden-image"
  sources = ["source.azure-arm.rhel9"]

  provisioner "shell" {
    script = "scripts/hardening.sh"
  }

  provisioner "shell" {
    script = "scripts/cleanup.sh"
  }
}