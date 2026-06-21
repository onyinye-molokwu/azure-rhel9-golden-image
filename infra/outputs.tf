output "resource_group_name" {
  value = azurerm_resource_group.golden.name
}

output "gallery_name" {
  value = azurerm_shared_image_gallery.golden.name
}

output "image_definition_name" {
  value = azurerm_shared_image.rhel9_cis.name
}