output "ecr_repository_uri" {
  value = data.aws_ecr_repository.my_ecr_repo.repository_url
}