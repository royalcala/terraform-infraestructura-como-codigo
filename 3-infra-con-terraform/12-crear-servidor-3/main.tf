# -------------------------
# Define el provider de AWS
# -------------------------
provider "aws" {
  region = "us-west-2"
}

# ---------------------------------------
# Define una instancia EC2 con AMI Ubuntu
# ---------------------------------------
#resource arguments (resource type, name)
resource "aws_instance" "my_server_one" {
  #amazon machine image ami, depends of the region you are working
  #https://us-east-1.console.aws.amazon.com/ec2/v2/home?region=us-east-1#LaunchInstances:
  ami           = "ami-0d70546e43a941d70"
  instance_type = "t2.micro"
}

#it will download all the plugins for example the provider
#terraform init

# it will see any changes that are required for your infrastructure
#If you ever set or change modules or backend configuration for Terraform,
#rerun this command to reinitialize your working directory
#terraform plan


#terraform destroy