module "s3_bucket" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}


# terraform {
#   backend "local" {
#     path = "./terraform.tfstate"
#   }
# }

# resource "aws_dynamodb_table" "example" {
#   name = "example"
#   hash_key = "TestTableHashKey"
#   billing_mode = "PAY_PER_REQUEST"
  
#   attribute {
#     name = "LockId"
#     type = "S"
#   }
# }

terraform {
  backend "s3" {
    bucket = "my-unique-s3-bucket-87887689786978"
    key = "./terraform.tfstate"
    region = "eu-west-3"
  }
}
