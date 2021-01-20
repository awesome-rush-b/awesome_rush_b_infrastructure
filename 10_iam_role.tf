// GH-Upload-To-S3 Policy for GitHub Actions to Upload to AWS S3
// Get Put List avs.codedeploy.dev/prod.brickea.me
resource "aws_iam_policy" "s3_ghUpLoad_role_policy" {
  name        = "${var.project_name}_GH_Upload_To_S3_policy"
  policy = file(var.cicd_upload_s3_file)
}

resource "aws_iam_user_policy_attachment" "s3_ghUpLoad_user_policy_attach" {
  user       = "cicd"
  policy_arn = aws_iam_policy.s3_ghUpLoad_role_policy.arn
}

// GH-Code-Deploy Policy for GitHub Actions to Call CodeDeploy
resource "aws_iam_policy" "cicd_backend_deploy_call_codeDeply_policy" {
  name        = "${var.project_name}_cicd_backend_call_codedeploy_policy"
  
  policy = file(var.cicd_backend_call_codedeploy_policy)
}

resource "aws_iam_user_policy_attachment" "gh_backend_code_deploy_call_codeDeply_user_policy_attach" {
  user       = "cicd"
  policy_arn = aws_iam_policy.cicd_backend_deploy_call_codeDeply_policy.arn
}

resource "aws_iam_policy" "cicd_frontend_deploy_call_codeDeply_policy" {
  name        = "${var.project_name}_cicd_frontend_call_codedeploy_policy"
  
  policy = file(var.cicd_frontend_call_codedeploy_policy)
}

resource "aws_iam_user_policy_attachment" "gh_frontend_code_deploy_call_codeDeply_user_policy_attach" {
  user       = "cicd"
  policy_arn = aws_iam_policy.cicd_frontend_deploy_call_codeDeply_policy.arn
}

// Give access to github for operating the ec2
resource "aws_iam_policy" "cicd_ec2_role_policy" {
  name        = "${var.project_name}_cicd_ec2_role_policy"
  policy = file(var.cicd_ec2_role_policy)
}

resource "aws_iam_user_policy_attachment" "cicd_ec2_policy_attach" {
  user       = "cicd"
  policy_arn = aws_iam_policy.cicd_ec2_role_policy.arn
}

// CodeDeploy-EC2-S3 Policy for the Server (EC2)
// Get List codedeploy.awesome.me
resource "aws_iam_policy" "s3_codeDeply_role_policy" {
  name        = "${var.project_name}_EC2_access_S3_codedeploy_policy"

  policy = file(var.EC2_access_S3_codedeploy_policy)
}

resource "aws_iam_role_policy_attachment" "s3_codeDeply_role_policy_attach" {
  role       = aws_iam_role.ec2_codedeploy_s3_access_role.name // attach to role EC2-AVS
  policy_arn = aws_iam_policy.s3_codeDeply_role_policy.arn // Policy CodeDeploy-EC2-S3

}

// AWSCodeDeployPolicy attach to role for creating codedeploy application
resource "aws_iam_role_policy_attachment" "AWSCodeDeployRole" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
  role       = aws_iam_role.codeDeployService_access_role.name
}

//*********************************************************************************

// codedeploy s3 access roles for ec2 instance
resource "aws_iam_role" "ec2_codedeploy_s3_access_role" {
  name = "${var.project_name}_ec2_codedeploy_s3_access_role"

  assume_role_policy = file(var.ec2_codedeploy_s3_access_role)
}

// codedeploy service role for creating codedeploy application
resource "aws_iam_role" "codeDeployService_access_role" {
  name = "${var.project_name}_CodeDeployServiceRole"

  assume_role_policy = file(var.codeDeployService_access_role)
}

//*********************************************************************************\
// User profile for ec2 instance
resource "aws_iam_instance_profile" "ec2_codedeploy_s3_access_profile" {
  name = "${var.project_name}_ec2_codedeploy_s3_access_profile"
  role = aws_iam_role.ec2_codedeploy_s3_access_role.name
}

