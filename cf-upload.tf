provider "digitalocean" {
    token = "${var.do_token}"
}

resource "digitalocean_droplet" "docker" {
    image = "docker"
    name = "docker"
    region = "nyc3"
    size = "8gb"
    ssh_keys = ["${var.ssh_key_id}"]
    connection {
        user = "root"
        key_file = "${var.key_path}"
    }
    provisioner "remote-exec" {
        inline = [
        "docker run lnguyen/cf-share-release /workspace/create_release.sh ${var.cf_version} ${var.aws_access_key} ${var.aws_secret_key}",
        ]
    }
}
