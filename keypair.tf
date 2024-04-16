# This file is used to create a key pair in AWS and store the private key in a local file.

resource "aws_key_pair" "my_keypair" {
  key_name   = var.keypair_name
  public_key = tls_private_key.my_private_key.public_key_openssh # Use the public key generated from a TLS private key
}

resource "tls_private_key" "my_private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# using resource to generate local file for private key 
resource "local_file" "private_key" {
  content  = tls_private_key.my_private_key.private_key_pem
  filename = "${path.module}/key/test-app-key.pem"
}
