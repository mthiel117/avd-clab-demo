# DC_FABRIC

## Table of Contents

- [Fabric Switches and Management IP](#fabric-switches-and-management-ip)
  - [Fabric Switches with inband Management IP](#fabric-switches-with-inband-management-ip)
- [Fabric Topology](#fabric-topology)
- [Fabric IP Allocation](#fabric-ip-allocation)
  - [Fabric Point-To-Point Links](#fabric-point-to-point-links)
  - [Point-To-Point Links Node Allocation](#point-to-point-links-node-allocation)
  - [Loopback Interfaces (BGP EVPN Peering)](#loopback-interfaces-bgp-evpn-peering)
  - [Loopback0 Interfaces Node Allocation](#loopback0-interfaces-node-allocation)
  - [VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)](#vtep-loopback-vxlan-tunnel-source-interfaces-vteps-only)
  - [VTEP Loopback Node allocation](#vtep-loopback-node-allocation)

## Fabric Switches and Management IP

| POD | Type | Node | Management IP | Platform | Provisioned in CloudVision | Serial Number |
| --- | ---- | ---- | ------------- | -------- | -------------------------- | ------------- |
| DC_FABRIC | l3leaf | LEAF1 | 172.31.0.27/23 | 7280 | Provisioned | - |
| DC_FABRIC | l3leaf | LEAF2 | 172.31.0.28/23 | 7280 | Provisioned | - |
| DC_FABRIC | l3leaf | LEAF3 | 172.31.0.29/23 | 7280 | Provisioned | - |
| DC_FABRIC | l3leaf | LEAF4 | 172.31.0.19/23 | 7280 | Provisioned | - |
| DC_FABRIC | spine | SPINE1 | 172.31.0.22/23 | 7050SX3 | Provisioned | - |
| DC_FABRIC | spine | SPINE2 | 172.31.0.23/23 | 7050SX3 | Provisioned | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| l3leaf | LEAF1 | Ethernet1 | spine | SPINE1 | Ethernet1 |
| l3leaf | LEAF1 | Ethernet2 | spine | SPINE2 | Ethernet1 |
| l3leaf | LEAF1 | Ethernet3 | mlag_peer | LEAF2 | Ethernet3 |
| l3leaf | LEAF1 | Ethernet4 | mlag_peer | LEAF2 | Ethernet4 |
| l3leaf | LEAF2 | Ethernet1 | spine | SPINE1 | Ethernet2 |
| l3leaf | LEAF2 | Ethernet2 | spine | SPINE2 | Ethernet2 |
| l3leaf | LEAF3 | Ethernet1 | spine | SPINE1 | Ethernet3 |
| l3leaf | LEAF3 | Ethernet2 | spine | SPINE2 | Ethernet3 |
| l3leaf | LEAF3 | Ethernet3 | mlag_peer | LEAF4 | Ethernet3 |
| l3leaf | LEAF3 | Ethernet4 | mlag_peer | LEAF4 | Ethernet4 |
| l3leaf | LEAF4 | Ethernet1 | spine | SPINE1 | Ethernet4 |
| l3leaf | LEAF4 | Ethernet2 | spine | SPINE2 | Ethernet4 |

## Fabric IP Allocation

### Fabric Point-To-Point Links

| Uplink IPv4 Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ---------------- | ------------------- | ------------------ | ------------------ |
| 10.0.0.0/24 | 256 | 16 | 6.25 % |

### Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |
| LEAF1 | Ethernet1 | 10.0.0.1/31 | SPINE1 | Ethernet1 | 10.0.0.0/31 |
| LEAF1 | Ethernet2 | 10.0.0.3/31 | SPINE2 | Ethernet1 | 10.0.0.2/31 |
| LEAF2 | Ethernet1 | 10.0.0.5/31 | SPINE1 | Ethernet2 | 10.0.0.4/31 |
| LEAF2 | Ethernet2 | 10.0.0.7/31 | SPINE2 | Ethernet2 | 10.0.0.6/31 |
| LEAF3 | Ethernet1 | 10.0.0.9/31 | SPINE1 | Ethernet3 | 10.0.0.8/31 |
| LEAF3 | Ethernet2 | 10.0.0.11/31 | SPINE2 | Ethernet3 | 10.0.0.10/31 |
| LEAF4 | Ethernet1 | 10.0.0.13/31 | SPINE1 | Ethernet4 | 10.0.0.12/31 |
| LEAF4 | Ethernet2 | 10.0.0.15/31 | SPINE2 | Ethernet4 | 10.0.0.14/31 |

### Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 1.1.1.0/24 | 256 | 6 | 2.35 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| DC_FABRIC | LEAF1 | 1.1.1.1/32 |
| DC_FABRIC | LEAF2 | 1.1.1.2/32 |
| DC_FABRIC | LEAF3 | 1.1.1.3/32 |
| DC_FABRIC | LEAF4 | 1.1.1.4/32 |
| DC_FABRIC | SPINE1 | 1.1.1.99/32 |
| DC_FABRIC | SPINE2 | 1.1.1.100/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------------ | ------------------- | ------------------ | ------------------ |
| 2.2.2.0/24 | 256 | 4 | 1.57 % |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
| DC_FABRIC | LEAF1 | 2.2.2.1/32 |
| DC_FABRIC | LEAF2 | 2.2.2.1/32 |
| DC_FABRIC | LEAF3 | 2.2.2.2/32 |
| DC_FABRIC | LEAF4 | 2.2.2.2/32 |
