variable "project_name" {
  description = "Project name for naming infrastructure resources."
  type        = string
  default     = "personal-static-website"
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

variable "github_repository" {
  description = "GitHub repository in owner/repository format."
  type        = string
  default     = "colby-smith/AWS-Static-Website-Hosting"
}

variable "github_branch" {
  description = "GitHub branch used for website content deployments."
  type        = string
  default     = "main"
}

variable "website_source_path" {
  description = "Repository path containing the static website content."
  type        = string
  default     = "src"
}
variable "github_connection_arn" {
  description = "ARN of the existing AWS CodeConnections GitHub connection."
  type        = string
  default     = "arn:aws:codeconnections:eu-west-1:897201145212:connection/99fb599a-fbbf-4d5a-8f3e-f4eff84551f6"
}