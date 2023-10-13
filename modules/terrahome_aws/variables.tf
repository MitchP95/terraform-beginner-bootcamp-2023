variable "user_uuid" {
  description = "UUID of the user"
  type        = string
  validation {
    condition        = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}$", var.user_uuid))
    error_message    = "Provided user_uuid value is not a valid UUID."
  }
}

variable "nasa_public_path" {
  description = "The public directory path"
  type        = string
}

variable "cybersecurity_public_path" {
  description = "The public directory path"
  type        = string
}

variable "content_version" {
  description = "The content version. Must be a positive integer starting at 1."
  type        = number

  validation {
    condition     = var.content_version > 0 && floor(var.content_version) == var.content_version
    error_message = "Any content_version must be a positive integer."
  }
}

variable "assets_path" {
  description = "Path to assets directory"
  type = string
}