resource "aws_instance" "ec2_backend_instance" {

    ami = var.backend_ec2_ami

    instance_type = "t2.micro" # 使用我们之前选的 instance type

    vpc_security_group_ids = [aws_security_group.ec2_security_group.id] # 使用我们创建的 安全组 注意这里 "aws_security_group." 后面接的名字是之前写的那个

    key_name = "awesome_terraform_aws" # 使用我们上一节中创建的 key pair

    iam_instance_profile = aws_iam_instance_profile.ec2_codedeploy_s3_access_profile.name

    subnet_id = aws_subnet.alpha_subnet.id
    associate_public_ip_address = true

    tags = {
        Name = "${var.project_name}_backend_ec2_instance"
    }
}

resource "aws_instance" "ec2_frontend_instance" {

    ami = var.frontend_ec2_ami

    instance_type = "t2.micro" # 使用我们之前选的 instance type

    vpc_security_group_ids = [aws_security_group.ec2_security_group.id] # 使用我们创建的 安全组 注意这里 "aws_security_group." 后面接的名字是之前写的那个

    key_name = "awesome_terraform_aws" # 使用我们上一节中创建的 key pair

    iam_instance_profile = aws_iam_instance_profile.ec2_codedeploy_s3_access_profile.name

    subnet_id = aws_subnet.beta_subnet.id
    associate_public_ip_address = true

    tags = {
        Name = "${var.project_name}_frontend_ec2_instance"
    }
}