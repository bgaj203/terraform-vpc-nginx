resource "aws_instance" "aws_ec2_instance" {
  ami = var.ami_intance_id
  instance_type = var.instance_type

  tags = {
    "Name" = "${var.project_name}_ec2_server"
  }

  subnet_id = var.public_subnet_id

  vpc_security_group_ids = [var.ssh_allowed_vpc_security_group_id]

  key_name = var.aws_key_pair_id

  provisioner "file" {
    source      = var.nginx_script_file
    destination = "/tmp/nginx.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/nginx.sh",
      "sudo /tmp/nginx.sh"
    ]
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file("${var.PRIVATE_KEY_PATH}")
  }
}