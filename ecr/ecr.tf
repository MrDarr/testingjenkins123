terraform {
<<<<<<< HEAD
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.18.0"
    }
=======
 required_providers {
  aws = {
   source = "hashicorp/aws"
   
>>>>>>> 936882c8c95845f69825e29e3e9f25a29f881087
  }
}

provider "aws" {
  # Configuration options
region = "us-east-1"
}
resource "aws_ecr_repository" "demo-repository" {
  name                 = "demo-repo"
  image_tag_mutability = "IMMUTABLE"
}

resource "aws_ecr_repository_policy" "demo-repo-policy" {
  repository = aws_ecr_repository.demo-repository.name
  policy     = <<EOF
  {
    "Version": "2008-10-17",
    "Statement": [
      {
        "Sid": "adds full ecr access to the demo repository",
        "Effect": "Allow",
        "Principal": "*",
        "Action": [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:CompleteLayerUpload",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetLifecyclePolicy",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ]
      }
    ]
  }
  EOF
}
