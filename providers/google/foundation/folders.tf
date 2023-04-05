resource "google_folder" "common" {
  display_name = "Common"
  parent       = "organizations/${var.org_id}"
}