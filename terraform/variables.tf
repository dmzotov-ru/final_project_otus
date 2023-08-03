variable "cloud_id" {
  description = "Cloud"
}
variable "folder_id" {
  description = "Folder"
}
variable "zone" {
  description = "Zone"
  default     = "ru-central1-a"
}
variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}
variable "private_key_path" {
  description = "Path to the private key used for ssh access"
}
variable gitlab_disk_image {
  description = "Disk image for gitlab"
}
variable "service_account_key_file" {
  description = "service account key file"
}
variable subnet_id {
  description = "Subnets for gitlab"
}
variable network_id {
  description = "Network ID"
}
variable sa_id {
  description = "Service account ID"
}
