###############################create these 2 resources first 
# resource "aws_s3_bucket" "mybucket" {
#    bucket = "s3statebackend-3212"
#    versioning {
#        enabled = true
#    }
#    server_side_encryption_configuration {
#        rule {
#            apply_server_side_encryption_by_default {
#                sse_algorithm = "AES256"
#            }
#        }
#    }
#}
#
##create dynamodb
#resource "aws_dynamodb_table" "statelock" {
#    name = "state-lock"
#    billing_mode = "PAY_PER_REQUEST"
#    hash_key = "LockID"
#
#    attribute {
#        name = "LockID"
#        type = "S"
#    }
#}
#
###############################
#
##once above resources are created  add this to your aws provider.tf
#
#terraform {
#    backend "s3" {
#        bucket = "s3statebackend-3212"
#        dynamodb_table = "state-lock"
#        key ="global/mystatefile/terraform.tfstate"
#        region = "us-east-1"
#        encrypt = true
#    }
#  required_providers {
#    kubectl = {
#      source  = "gavinbunney/kubectl"
#      version = ">= 1.7.0"
#    }
#  }

#}
#https://www.youtube.com/watch?v=o04xfWEouKM&ab_channel=CloudChamp
