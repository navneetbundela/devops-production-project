resource "aws_ecr_repository" "repo" {
    name = var.repository_name
    image_scanning_configuration {
      scan_on_push = true
    }
    image_tag_mutability = "MUTABLE"

    tags = {
      Name = var.repository_name
    }
}

resource "aws_ecr_lifecycle_policy" "ecr_policy" {
  repository = aws_ecr_repository.repo.name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Keep last 10 images",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["v"],
                "countType": "imageCountMoreThan",
                "countNumber": 10
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}