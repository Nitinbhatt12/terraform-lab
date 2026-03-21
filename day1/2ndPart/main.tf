terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

provider "local" {}

# ✅ Variable define
variable "message" {
  description = "Message to write in file"
  type        = string
  default     = "Hello from Terraform"
}

# ✅ Resource
resource "local_file" "hello" {
  filename = "hello.txt"
  content  = var.message   # <-- variable used
}

# ✅ Output
output "file_path" {
  description = "Path of created file"
  value       = local_file.hello.filename
}