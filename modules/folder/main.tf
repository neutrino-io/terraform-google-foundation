resource "google_folder" "app-folder" {
  display_name = var.app_org_label
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "app-folder-development" {
  display_name = "Development"
  parent       = google_folder.app-folder.name
}

resource "google_folder" "app-folder-non-production" {
  display_name = "Non-Production"
  parent       = google_folder.app-folder.name
}

resource "google_folder" "app-folder-production" {
  display_name = "Production"
  parent       = google_folder.app-folder.name
}

# Outputs
output "folder-development" {
  value = google_folder.app-folder-development
}

output "folder-non-production" {
  value = google_folder.app-folder-non-production
}

output "folder-production" {
  value = google_folder.app-folder-production
}