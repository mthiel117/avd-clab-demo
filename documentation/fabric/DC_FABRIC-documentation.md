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
| DC_FABRIC | spine | SPINE1 | 172.31.0.26/23 | 7050SX3 | Provisioned | - |
| DC_FABRIC | spine | SPINE2 | 172.31.0.38/23 | 7050SX3 | Provisioned | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| l3leaf | LEAF1 | Ethernet21 | spine | SPINE1 | Ethernet9/1 |
| l3leaf | LEAF1 | Ethernet22 | spine | SPINE2 | Ethernet1/1 |
| l3leaf | LEAF1 | Ethernet43 | mlag_peer | LEAF2 | Ethernet43 |
| l3leaf | LEAF1 | Ethernet45 | mlag_peer | LEAF2 | Ethernet45 |
| l3leaf | LEAF2 | Ethernet21 | spine | SPINE2 | Ethernet3/1 |
| l3leaf | LEAF2 | Ethernet24 | spine | SPINE1 | Ethernet9/2 |
| l3leaf | LEAF3 | Ethernet23 | spine | SPINE1 | Ethernet9/3 |
| l3leaf | LEAF3 | Ethernet24 | spine | SPINE2 | Ethernet5/1 |

## Fabric IP Allocation

### Fabric Point-To-Point Links

| Uplink IPv4 Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ---------------- | ------------------- | ------------------ | ------------------ |
| 10.0.0.0/24 | 256 | 12 | 4.69 % |

### Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |
| LEAF1 | Ethernet21 | 10.0.0.1/31 | SPINE1 | Ethernet9/1 | 10.0.0.0/31 |
| LEAF1 | Ethernet22 | 10.0.0.3/31 | SPINE2 | Ethernet1/1 | 10.0.0.2/31 |
| LEAF2 | Ethernet21 | 10.0.0.7/31 | SPINE2 | Ethernet3/1 | 10.0.0.6/31 |
| LEAF2 | Ethernet24 | 10.0.0.5/31 | SPINE1 | Ethernet9/2 | 10.0.0.4/31 |
| LEAF3 | Ethernet23 | 10.0.0.9/31 | SPINE1 | Ethernet9/3 | 10.0.0.8/31 |
| LEAF3 | Ethernet24 | 10.0.0.11/31 | SPINE2 | Ethernet5/1 | 10.0.0.10/31 |

### Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 1.1.1.0/24 | 256 | 5 | 1.96 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| DC_FABRIC | LEAF1 | 1.1.1.1/32 |
| DC_FABRIC | LEAF2 | 1.1.1.2/32 |
| DC_FABRIC | LEAF3 | 1.1.1.3/32 |
| DC_FABRIC | SPINE1 | 1.1.1.99/32 |
| DC_FABRIC | SPINE2 | 1.1.1.100/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------------ | ------------------- | ------------------ | ------------------ |
| 2.2.2.0/24 | 256 | 3 | 1.18 % |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
| DC_FABRIC | LEAF1 | 2.2.2.1/32 |
| DC_FABRIC | LEAF2 | 2.2.2.1/32 |
| DC_FABRIC | LEAF3 | 2.2.2.2/32 |
