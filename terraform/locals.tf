# Is used to manipulate the data 
locals {
  common_tags = {
    Department = "DevOps"
    Owner      = "DevOps Team"
  }
}

locals {
  myworkspace = {
    TF_Workspace = terraform.workspace
    Name         = "DevOps"
  }
}