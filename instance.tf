# instance/instance.tf
variable "ip" { type = "string" }
variable "vpc_id" { type = "string" }

resource "aws_instance" "foo" {
  ami           = "ami-50946030"
  instance_type = "t2.nano"
  vpc_id        = "${var.vpc_id}"
  provisioner "local-exec" {
    command = "echo ${self.id} - ${var.ip}"
  }
}

output "ip" {
  value = ["${aws_instance.foo.*.private_ip}"]
}
