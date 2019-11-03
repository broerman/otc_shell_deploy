resource "openstack_compute_instance_v2" "webserver" {
  count           = "${var.instance_count}"
  name            = "${var.project}-webserver${format("%02d", count.index+1)}"
  image_name      = "${var.image_name}"
  flavor_name     = "${var.flavor_name}"
  key_pair        = "${openstack_compute_keypair_v2.keypair.name}"
  security_groups = [
    "${openstack_compute_secgroup_v2.secgrp_web.name}"
  ]

  network {
    uuid = "${openstack_networking_network_v2.network.id}"
  }
  depends_on      = ["openstack_networking_router_interface_v2.interface"]
}

resource "openstack_compute_floatingip_associate_v2" "webserver_fip" {
  count                 = "${var.instance_count}"
  floating_ip           = "${openstack_networking_floatingip_v2.fip[count.index].address}"
  instance_id           = "${openstack_compute_instance_v2.webserver[count.index].id}"
  wait_until_associated = "true"
}
