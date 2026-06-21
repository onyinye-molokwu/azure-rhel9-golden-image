resource "azurerm_shared_image_gallery" "golden" {
  name                = var.gallery_name
  resource_group_name = azurerm_resource_group.golden.name
  location            = azurerm_resource_group.golden.location
  description         = "Azure Compute Gallery for CIS-assessed RHEL 9 golden images"
}

resource "azurerm_shared_image" "rhel9_cis" {
  name                = var.image_definition_name
  gallery_name        = azurerm_shared_image_gallery.golden.name
  resource_group_name = azurerm_resource_group.golden.name
  location            = azurerm_resource_group.golden.location
  os_type             = "Linux"
  hyper_v_generation  = "V2"

  identifier {
    publisher = "Onyinye"
    offer     = "RHEL9"
    sku       = "CIS"
  }
}