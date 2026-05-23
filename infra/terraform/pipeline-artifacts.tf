resource "aws_s3_bucket" "pipeline_artifacts" {
  bucket = "${var.project_name}-pipeline-artifacts-${var.environment_suffix}"

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-pipeline-artifacts-${var.environment_suffix}"
    }
  )
}