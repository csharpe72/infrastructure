terraform { 
	backend "s3" { 
    	bucket     = "jenkins-terraform-state-bucket-dnav6eiw"
        key        = "network/terraform.tfstate" 
        region     = "us-east-1" 
        encrypt    = true 
   }
} 

resource "aws_vpc" "main_vpc" { 
	cidr_block           = var.cidr_block 
    enable_dns_support   = true 
    enable_dns_hostnames = true 
    
    tags = { 
    	Name        = "jenkins-instance-main_vpc" 
    } 
}