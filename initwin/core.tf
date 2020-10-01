## This configuration was generated by terraform-provider-oci

data oci_identity_availability_domain SXdD-US-ASHBURN-AD-1 {
  compartment_id = var.compartment_ocid
  ad_number      = "1"
}
data oci_identity_availability_domain SXdD-US-ASHBURN-AD-2 {
  compartment_id = var.compartment_ocid
  ad_number      = "2"
}
data oci_identity_availability_domain SXdD-US-ASHBURN-AD-3 {
  compartment_id = var.compartment_ocid
  ad_number      = "3"
}
data oci_core_services test_services {
}

resource oci_core_instance instance-public-ossh {
  agent_config {
    is_management_disabled = "false"
    is_monitoring_disabled = "false"
  }
  availability_config {
    recovery_action = "RESTORE_INSTANCE"
  }
  availability_domain = data.oci_identity_availability_domain.SXdD-US-ASHBURN-AD-1.name
  compartment_id      = var.compartment_ocid

  create_vnic_details {
    assign_public_ip = "true"
    freeform_tags = {
    }
    nsg_ids = [
    ]
    skip_source_dest_check = "false"
    subnet_id              = oci_core_subnet.Public-Subnet-vcngbuossh.id
  }
  display_name = "instance-public-ossh"
  extended_metadata = {
  }
  fault_domain = "FAULT-DOMAIN-1"
  freeform_tags = {
  }
  launch_options {
    boot_volume_type                    = "PARAVIRTUALIZED"
    firmware                            = "UEFI_64"
    is_consistent_volume_naming_enabled = "true"
    network_type                        = "PARAVIRTUALIZED"
    remote_data_volume_type             = "PARAVIRTUALIZED"
  }
  metadata = {
    "ssh_authorized_keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFaWre7kqUVvv/pnzT6pswlaVNrxgNkWcM9vXJcVfNJWvFMPsCvrQLSW0zbDoLks5ZpBKyZfnWw5sIdB9rr3PRWyquwgAf+VojcYLe++DRlL1Lpwtz8jiR4XqhbJ0ZHZFOooHcpVGFLqX/vmIKdQuaEGqeZnHDWxZZHt4gI+s5SdK1IQ9KKc11CYx24nO8MoK8tDuff7xvsiIhF2kCptrbthkkDa6m8rFhgzAiF8TSFIOMWtKYtWa4xfPwRJjrfSYMfF9sO/9LYvKSnVCT1IlTT/08cYNSvxM3BJ9h19JmBHnuZUxKWQC00nBTfwV8BUVuCwcFlGGotgBRf84w2v6r tomel_000@m4700"
    "user_data"           = "${base64encode(file("./cloud_init.sh"))}"
  }
  shape = "VM.Standard2.1"
  shape_config {
    ocpus = "1"
  }
  source_details {
    source_id   = var.instance-20200824-2005_source_image_id
    source_type = "image"
  }
}
resource oci_core_instance instance-private-ossh {
  agent_config {
    is_management_disabled = "false"
    is_monitoring_disabled = "false"
  }
  availability_config {
    recovery_action = "RESTORE_INSTANCE"
  }
  availability_domain = data.oci_identity_availability_domain.SXdD-US-ASHBURN-AD-2.name
  compartment_id      = var.compartment_ocid
  create_vnic_details {
    assign_public_ip = "false"
    freeform_tags = {
    }
    nsg_ids = [
    ]
    skip_source_dest_check = "false"
    subnet_id              = oci_core_subnet.Private-Subnet-vcngbuossh.id
  }
  display_name = "instance-private-ossh"
  extended_metadata = {
  }
  fault_domain = "FAULT-DOMAIN-1"
  freeform_tags = {
  }
  launch_options {
    boot_volume_type                    = "PARAVIRTUALIZED"
    firmware                            = "UEFI_64"
    is_consistent_volume_naming_enabled = "true"
    network_type                        = "PARAVIRTUALIZED"
    remote_data_volume_type             = "PARAVIRTUALIZED"
  }
  metadata = {
    "ssh_authorized_keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFaWre7kqUVvv/pnzT6pswlaVNrxgNkWcM9vXJcVfNJWvFMPsCvrQLSW0zbDoLks5ZpBKyZfnWw5sIdB9rr3PRWyquwgAf+VojcYLe++DRlL1Lpwtz8jiR4XqhbJ0ZHZFOooHcpVGFLqX/vmIKdQuaEGqeZnHDWxZZHt4gI+s5SdK1IQ9KKc11CYx24nO8MoK8tDuff7xvsiIhF2kCptrbthkkDa6m8rFhgzAiF8TSFIOMWtKYtWa4xfPwRJjrfSYMfF9sO/9LYvKSnVCT1IlTT/08cYNSvxM3BJ9h19JmBHnuZUxKWQC00nBTfwV8BUVuCwcFlGGotgBRf84w2v6r tomel_000@m4700"
    "user_data"           = "${base64encode(file("./cloud_init.sh"))}"
  }
  shape = "VM.Standard2.1"
  shape_config {
    ocpus = "1"
  }
  source_details {
    source_id   = var.instance-20200824-2005_source_image_id
    source_type = "image"
  }
}
resource oci_core_internet_gateway Internet-Gateway-vcngbuossh {
  compartment_id = var.compartment_ocid
  display_name = "Internet Gateway-vcngbuossh"
  enabled      = "true"
  vcn_id = oci_core_vcn.vcngbuossh.id
}
#resource oci_core_public_ip IP-for-NAT-gateway-vcngbuossh {
#  compartment_id = var.compartment_ocid
#  display_name = "IP for NAT gateway: vcngbuossh"
  #lifetime = "EPHEMERAL"
  #vcn_id = oci_core_vcn.vcngbuossh.id
#}
resource oci_core_service_gateway Service-Gateway-vcngbuossh {
  compartment_id = var.compartment_ocid
  display_name = "Service Gateway-vcngbuossh"
  services {
    service_id = "${data.oci_core_services.test_services.services.0.id}"
  }
  vcn_id = oci_core_vcn.vcngbuossh.id
}
resource oci_core_subnet Private-Subnet-vcngbuossh {
  cidr_block     = "10.100.1.0/24"
  compartment_id = var.compartment_ocid
  dhcp_options_id = oci_core_vcn.vcngbuossh.default_dhcp_options_id
  display_name    = "Private Subnet-vcngbuossh"
  dns_label       = ""
  prohibit_public_ip_on_vnic = "true"
  route_table_id             = oci_core_route_table.Route-Table-for-Private-Subnet-vcngbuossh.id
  security_list_ids = [
    oci_core_security_list.Security-List-for-Private-Subnet-vcngbuossh.id,
  ]
  vcn_id = oci_core_vcn.vcngbuossh.id
}
resource oci_core_subnet Public-Subnet-vcngbuossh {
  cidr_block     = "10.100.0.0/24"
  compartment_id = var.compartment_ocid
  dhcp_options_id = oci_core_vcn.vcngbuossh.default_dhcp_options_id
  display_name    = "Public Subnet-vcngbuossh"
  dns_label       = ""
  prohibit_public_ip_on_vnic = "false"
  route_table_id             = oci_core_vcn.vcngbuossh.default_route_table_id
  security_list_ids = [
    oci_core_vcn.vcngbuossh.default_security_list_id,
  ]
  vcn_id = oci_core_vcn.vcngbuossh.id
}
#resource oci_core_private_ip instance-private-vcngbuossh {
#  display_name = "instance-private-vcngbuossh "
#  freeform_tags = {
#  }
#  hostname_label = "instance-private-vcngbuossh "
#  vnic_id = ""
#}
#resource oci_core_private_ip instance-public-vcngbuossh {
#  display_name = "instance-public-vcngbuossh"
#  freeform_tags = {
#  }
#  hostname_label = "instance-public-vcngbuossh"
#  vnic_id = ""
#}
resource oci_core_vcn vcngbuossh {
  cidr_block     = "10.100.0.0/16"
  compartment_id = var.compartment_ocid
  display_name = "vcngbuossh"
  dns_label    = "vcngbuossh"
}
resource oci_core_default_dhcp_options Default-DHCP-Options-for-vcngbuossh {
  display_name = "Default DHCP Options for vcngbuossh"
  manage_default_resource_id = oci_core_vcn.vcngbuossh.default_dhcp_options_id
  options {
    custom_dns_servers = [
    ]
    server_type = "VcnLocalPlusInternet"
    type        = "DomainNameServer"
  }
  options {
    search_domain_names = [
      "vcngbuossh.oraclevcn.com",
    ]
    type = "SearchDomain"
  }
}
resource oci_core_nat_gateway NAT-Gateway-vcngbuossh {
  block_traffic  = "false"
  compartment_id = var.compartment_ocid
  display_name = "NAT Gateway-vcngbuossh"
  vcn_id = oci_core_vcn.vcngbuossh.id
}
resource oci_core_route_table Route-Table-for-Private-Subnet-vcngbuossh {
  compartment_id = var.compartment_ocid
  display_name = "Route Table for Private Subnet-vcngbuossh"
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.NAT-Gateway-vcngbuossh.id
  }
  route_rules {
    destination       = "all-iad-services-in-oracle-services-network"
    destination_type  = "SERVICE_CIDR_BLOCK"
    network_entity_id = oci_core_service_gateway.Service-Gateway-vcngbuossh.id
  }
  vcn_id = oci_core_vcn.vcngbuossh.id
}
resource oci_core_default_route_table Default-Route-Table-for-vcngbuossh {
  display_name = "Default Route Table for vcngbuossh"
  manage_default_resource_id = oci_core_vcn.vcngbuossh.default_route_table_id
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.Internet-Gateway-vcngbuossh.id
  }
}
resource oci_core_security_list Security-List-for-Private-Subnet-vcngbuossh {
  compartment_id = var.compartment_ocid
  display_name = "Security List for Private Subnet-vcngbuossh"
  egress_security_rules {
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol  = "all"
    stateless = "false"
  }
  ingress_security_rules {
    protocol    = "6"
    source      = "10.100.0.0/16"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "22"
      min = "22"
    }
  }
  ingress_security_rules {
    icmp_options {
      code = "4"
      type = "3"
    }
    protocol    = "1"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
  }
  ingress_security_rules {
    icmp_options {
      code = "-1"
      type = "3"
    }
    protocol    = "1"
    source      = "10.100.0.0/16"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
  }
  vcn_id = oci_core_vcn.vcngbuossh.id
}
resource oci_core_default_security_list Default-Security-List-for-vcngbuossh {
  display_name = "Default Security List for vcngbuossh"
  egress_security_rules {
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol  = "all"
    stateless = "false"
  }
  ingress_security_rules {
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "22"
      min = "22"
    }
  }
  ingress_security_rules {
    icmp_options {
      code = "4"
      type = "3"
    }
    protocol    = "1"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
  }
  ingress_security_rules {
    icmp_options {
      code = "-1"
      type = "3"
    }
    protocol    = "1"
    source      = "10.100.0.0/16"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
  }
  manage_default_resource_id = oci_core_vcn.vcngbuossh.default_security_list_id
}

output "instance-public-ossh" {
  description = "instance-public-ossh public_ip" 
  value = oci_core_instance.instance-public-ossh.public_ip 
}

output "instance-private-ossh" {
  description = "instance-private-ossh private_ip" 
  value = oci_core_instance.instance-private-ossh.private_ip
}