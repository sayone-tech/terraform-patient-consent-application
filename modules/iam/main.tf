resource "aws_iam_role" "ec2_iam_role" {
name        =  lower("${var.App_Name}-${var.Env_Type}")

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_iam_profile" {
  name = lower("${var.App_Name}-${var.Env_Type}")
  role = aws_iam_role.ec2_iam_role.name
}

resource "aws_iam_policy" "iam_policy_secretsmanager" {
  name = lower("${var.App_Name}-${var.Env_Type}-secretsmanager")
  # role = aws_iam_role.ec2_iam_role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "VisualEditor0",
                "Effect": "Allow",
                "Action": [
                    "secretsmanager:GetResourcePolicy",
                    "secretsmanager:GetSecretValue",
                    "secretsmanager:DescribeSecret",
                    "secretsmanager:ListSecretVersionIds"
                ],
                "Resource": "${var.SECRETSMANAGER_ARN}"
            },
            {
                "Sid": "VisualEditor1",
                "Effect": "Allow",
                "Action": "secretsmanager:ListSecrets",
                "Resource": "*"
            }
        ]
    })
}

resource "aws_iam_policy" "iam_policy_ecr" {
  name = lower("${var.App_Name}-${var.Env_Type}-ecr")
#   role = aws_iam_role.ec2_iam_role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
      "Version": "2012-10-17",
      "Statement": [
          {
              "Sid": "VisualEditor0",
              "Effect": "Allow",
              "Action": [
                  "ecr:GetRegistryPolicy",
                  "ecr:DescribeRegistry",
                  "ecr:DescribePullThroughCacheRules",
                  "ecr:GetAuthorizationToken",
                  "ecr:PutRegistryScanningConfiguration",
                  "ecr:DeleteRegistryPolicy",
                  "ecr:CreatePullThroughCacheRule",
                  "ecr:DeletePullThroughCacheRule",
                  "ecr:PutRegistryPolicy",
                  "ecr:GetRegistryScanningConfiguration",
                  "ecr:PutReplicationConfiguration",
                  "ecr:CompleteLayerUpload"
              ],
              "Resource": "*"
          },
          {
              "Sid": "VisualEditor1",
              "Effect": "Allow",
              "Action": "ecr:*",
              "Resource": "${var.ECR_ARN}"
          }
      ]
  })
}

resource "aws_iam_role_policy_attachment" "ec2_iam_role_attach_secretsmanager" {
  role       = aws_iam_role.ec2_iam_role.id
  policy_arn = aws_iam_policy.iam_policy_secretsmanager.arn
}

resource "aws_iam_role_policy_attachment" "ec2_iam_role_attach_ecr" {
  role       = aws_iam_role.ec2_iam_role.id
  policy_arn = aws_iam_policy.iam_policy_ecr.arn
}

resource "aws_iam_user" "jenkins-iam-user" {
  name = lower("${var.App_Name}-${var.Env_Type}-jenkins")
}


resource "aws_iam_user_policy_attachment" "ec2_iam_user_attach_secretsmanager" {
  user       = aws_iam_user.jenkins-iam-user.name
  policy_arn = aws_iam_policy.iam_policy_secretsmanager.arn
}

resource "aws_iam_user_policy_attachment" "ec2_iam_user_attach_ecr" {
  user       = aws_iam_user.jenkins-iam-user.name
  policy_arn = aws_iam_policy.iam_policy_ecr.arn
}