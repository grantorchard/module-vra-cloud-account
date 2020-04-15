data vra_data_collector "this" {
  count = var.data_collector_name != "" ? 1 : 0
  name = var.data_collector_name
}

data vsphere_datacenter "this" {
  for_each = toset(var.enabled_datacenters)
  name     = each.value
}

resource vra_cloud_account_vsphere "this" {
  name                    = replace(var.name, " ", "_")
  description             = var.description
  username                = var.vcenter_username
  password                = var.vcenter_password
  hostname                = var.vcenter_hostname
  dcid                    = var.data_collector_name != "" ? data.vra_data_collector.this[0].id : var.data_collector_name
  regions                 = [for v in data.vsphere_datacenter.this: format("Datacenter:%s", v.id)]
  accept_self_signed_cert = var.accept_self_signed_cert
  dynamic tags {
    for_each = var.capability_tags
    content {
      key   = tags.value["key"]
      value = tags.value["value"]
    }
  }
}