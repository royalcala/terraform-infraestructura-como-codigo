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
resource "aws_instance" "mi_servidor" {
  #https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#argument-reference
  #https://us-east-1.console.aws.amazon.com/ec2/v2/home?region=us-east-1#LaunchInstances:

  ami                    = "ami-0d70546e43a941d70"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.mi_grupo_de_seguridad.id]

  // Escribimos un "here document" que es
  // usado durante la inicialización
  user_data = <<-EOF
              #!/bin/bash
              echo "Hola Terraformers!" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  tags = {
    Name = "servidor-1"
  }
}

# ------------------------------------------------------
# Define un grupo de seguridad con acceso al puerto 8080
# ------------------------------------------------------
resource "aws_security_group" "mi_grupo_de_seguridad" {
  name = "primer-servidor-sg"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Acceso al puerto 8080 desde el exterior"
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
  }
}

#it will download all the plugins for example the provider
#terraform init

# it will see any changes that are required for your infrastructure
#If you ever set or change modules or backend configuration for Terraform,
#rerun this command to reinitialize your working directory
#terraform plan


#terraform destroy
