variable name {
  type    = string
}

variable capability_tags {
  type        = list(map(string))
  description = "Capability tags to be applied to the Cloud Account"
  default = []
}

variable data_collector_name {
  type = string
  default = ""
}

variable description {
  type = string
  default = ""
}

variable vcenter_hostname {
  type = string
}

variable vcenter_username {
  type = string
}

variable vcenter_password {
  type = string
}

variable accept_self_signed_cert {
  type = bool
  default = true
}

variable enabled_datacenters {
  type = list
}