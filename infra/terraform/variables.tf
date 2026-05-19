variable "project_name" {
  description = "Project name for naming infrastructure resources"
  type      = string
  default   = "personal-static-website"
}

variable "environment_suffix" {
  description = "Environment suffix for naming resources."
  type        = string
  default     = "pr"
}
variable "domain_name" {
  description = "Primary domain name for the static website."
  type        = string
  default     = "colby-smith-labs.com"
}

variable "www_domain_name" {
  description = "WWW subdomain for the static website."
  type        = string
  default     = "www.colby-smith-labs.com"
}
variable "aws_region" {
  description = "Primary AWS region for regional resources."
  type        = string
  default     = "eu-west-1"
}

variable "index_document" {
  description = "Default index document for the static website."
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = "Default error document for the static website."
  type        = string
  default     = "404.html"
}