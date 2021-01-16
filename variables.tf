variable "project_name" {
  default = "awesome_rush_b"
}

variable "database_username" {
  default = "awesomeRushB"
}

variable "database_password" {
  default = "welove521024."
}

variable "codedeploy_s3" {
  default = "codedeploy.awesomerushb.me"
}

variable "ec2_ami" {
  default = "ami-0930bfc3840d729b6"
}

variable "cicd_upload_s3_file" {
  default = "policy/cicd_upload_s3_file.json"
}

variable "cicd_call_codedeploy_policy" {
  default = "policy/cicd_call_codedeploy.json"
}

variable "cicd_ec2_role_policy" {
  default = "policy/cicd_ec2.json"
}

variable "EC2_access_S3_codedeploy_policy" {
  default = "policy/ec2_codedeploy_s3.json"
}

variable "ec2_codedeploy_s3_access_role" {
  default = "policy/ec2_codedeploy_s3_role_assume.json"
}

variable "codeDeployService_access_role" {
  default = "policy/codedeploy_application_role_assume.json"
}


