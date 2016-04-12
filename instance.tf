# instance/instance.tf
variable "ip" { type = "string" }

resource "aws_instance" "foo" {
  ami           = "ami-50946030"
  instance_type = "t2.nano"
  provisioner "local-exec" {
    command = "echo ${self.id} - ${var.ip}"
  }
}

output "ip" {
  value = "${aws_instance.foo.*.private_ip}"
}
