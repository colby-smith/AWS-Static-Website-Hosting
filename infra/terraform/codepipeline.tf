data "aws_iam_policy_document" "website_content_deploy" {
  statement {
    sid = "ListWebsiteBucket"

    actions = [
      "s3:ListBucket"
    ]

    resources = [
      aws_s3_bucket.website.arn
    ]
  }

  statement {
    sid = "DeployWebsiteObjects"

    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject"
    ]

    resources = [
      "${aws_s3_bucket.website.arn}/*"
    ]
  }

  statement {
    sid = "CreateCloudFrontInvalidation"

    actions = [
      "cloudfront:CreateInvalidation"
    ]

    resources = [
      aws_cloudfront_distribution.website.arn
    ]
  }
}

module "website_content_pipeline" {
  source = "git::https://github.com/colby-smith/AWS-CodePipeline-Terraform-Module.git?ref=main"

  project_name      = "${var.project_name}-website-content-${var.environment_suffix}"
  artifact_bucket   = aws_s3_bucket.pipeline_artifacts.bucket
  source_repository = var.github_repository
  source_branch     = var.github_branch

  source_provider = "CodeStarSourceConnection"
  connection_arn  = var.github_connection_arn

  pipeline_type = "V2"

  source_path_includes = [
    "${var.website_source_path}/**"
  ]

  buildspec = "scripts/buildspec.yml"

  environment_variables = [
    {
      name  = "WEBSITE_SOURCE_PATH"
      value = var.website_source_path
      type  = "PLAINTEXT"
    },
    {
      name  = "WEBSITE_BUCKET_NAME"
      value = aws_s3_bucket.website.bucket
      type  = "PLAINTEXT"
    },
    {
      name  = "CLOUDFRONT_DISTRIBUTION_ID"
      value = aws_cloudfront_distribution.website.id
      type  = "PLAINTEXT"
    }
  ]

  additional_codebuild_policy_documents = [
    data.aws_iam_policy_document.website_content_deploy.json
  ]

  tags = local.common_tags
}