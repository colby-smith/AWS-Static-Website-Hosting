locals {
  common_tags = {
    Project     = "personal-static-website"
    Application = "colby-smith-labs"
    Environment = "production"
    repository  = "AWS-Static-Website-Hosting"
    ManagedBy   = "terraform"
  }
}