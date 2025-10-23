resource "aws_iam_role" "wordpress" {
  name = "WordpressRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = ["ec2.amazonaws.com"]
        }
        Action = ["sts:AssumeRole"]
      }
    ]
  })
  tags = { "name" = "${var.env}-${var.name_prefix}-role" }
}

resource "aws_iam_role_policy_attachment" "wordpress" {
  for_each   = local.wordpress_managed_policies
  role       = aws_iam_role.wordpress.name
  policy_arn = each.value
}

resource "aws_iam_instance_profile" "wordpress" {
  name = "WordpressInstanceProfile"
  role = aws_iam_role.wordpress.name
  tags = { "name" = "${var.env}-${var.name_prefix}-instance-profile" }
}


resource "aws_iam_role_policy" "ssm_params_read" {
  role = aws_iam_role.wordpress.name
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["ssm:GetParameter", "ssm:GetParameters"],
        Resource = "arn:aws:ssm:${var.aws_region}:${data.aws_caller_identity.current.account_id}:parameter/${var.env}/${var.name_prefix}/*"
      },
      {
        Effect    = "Allow",
        Action    = ["kms:Decrypt"],
        Resource  = "arn:aws:kms:${var.aws_region}:${data.aws_caller_identity.current.account_id}:alias/aws/ssm",
        Condition = { StringEquals = { "kms:ViaService" = "ssm.${var.aws_region}.amazonaws.com" } }
      }
    ]
  })
}