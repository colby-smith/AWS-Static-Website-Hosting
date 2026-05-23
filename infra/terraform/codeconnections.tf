resource "aws_codeconnections_connection" "github" {
  name          = "${var.project_name}-github-connection-${var.environment_suffix}"
  provider_type = "GitHub"

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-github-connection-${var.environment_suffix}"
    }
  )
}