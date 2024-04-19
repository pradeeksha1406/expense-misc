terraform {
  backend "s3" {
    bucket = "terraform-p100"
    key    = "misc/sonarqube-ip/terraform.tfstate"
    region = "us-east-1"

  }
}

data "aws_instance" "instance" {
  instance_id = "i-0e33dca48d371c58d"
}

resource "aws_route53_record" "sonarqube" {
  name    = "sonarqube.techadda.co"
  type    = "A"
  zone_id = "Z02181513KJGBXLJM7332"
  records = [data.aws_instance.instance.public_ip]
  ttl     = 10
}


#data "aws_instance" "artifactory" {
#  instance_id = "i-0e33dca48d371c58d"
#}
#
#resource "aws_route53_record" "artifactory" {
#  name    = "artifactory.techadda.co"
#  type    = "A"
#  zone_id = "Z02181513KJGBXLJM7332"
#  records = [data.aws_instance.artifactory.public_ip]
#  ttl     = 10
#}