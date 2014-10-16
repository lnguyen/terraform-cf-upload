provider "digitalocean" {
    token = "${var.do_token}"
}

resource "digitalocean_droplet" "docker" {
    image = "6734560"
    name = "docker"
    region = "nyc2"
    size = "2gb"
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
