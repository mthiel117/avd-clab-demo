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
| DC_FABRIC | leaf | LEAF1 | 172.100.100.103/24 | cEOS | Provisioned | - |
| DC_FABRIC | leaf | LEAF2 | 172.100.100.104/24 | cEOS | Provisioned | - |
| DC_FABRIC | leaf | LEAF3 | 172.100.100.105/24 | cEOS | Provisioned | - |
| DC_FABRIC | leaf | LEAF4 | 172.100.100.106/24 | cEOS | Provisioned | - |
| DC_FABRIC | l3spine | SPINE1 | 172.100.100.101/24 | cEOS | Provisioned | - |
| DC_FABRIC | l3spine | SPINE2 | 172.100.100.102/24 | cEOS | Provisioned | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| leaf | LEAF1 | Ethernet1 | l3spine | SPINE1 | Ethernet1 |
| leaf | LEAF1 | Ethernet2 | l3spine | SPINE2 | Ethernet1 |
| leaf | LEAF1 | Ethernet3 | mlag_peer | LEAF2 | Ethernet3 |
| leaf | LEAF1 | Ethernet4 | mlag_peer | LEAF2 | Ethernet4 |
| leaf | LEAF2 | Ethernet1 | l3spine | SPINE1 | Ethernet2 |
| leaf | LEAF2 | Ethernet2 | l3spine | SPINE2 | Ethernet2 |
| leaf | LEAF3 | Ethernet1 | l3spine | SPINE1 | Ethernet3 |
| leaf | LEAF3 | Ethernet2 | l3spine | SPINE2 | Ethernet3 |
| leaf | LEAF3 | Ethernet3 | mlag_peer | LEAF4 | Ethernet3 |
| leaf | LEAF3 | Ethernet4 | mlag_peer | LEAF4 | Ethernet4 |
| leaf | LEAF4 | Ethernet1 | l3spine | SPINE1 | Ethernet4 |
| leaf | LEAF4 | Ethernet2 | l3spine | SPINE2 | Ethernet4 |
| l3spine | SPINE1 | Ethernet5 | mlag_peer | SPINE2 | Ethernet5 |
| l3spine | SPINE1 | Ethernet6 | mlag_peer | SPINE2 | Ethernet6 |

## Fabric IP Allocation

### Fabric Point-To-Point Links

| Uplink IPv4 Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ---------------- | ------------------- | ------------------ | ------------------ |

### Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |

### Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 10.1.252.0/24 | 256 | 2 | 0.79 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| DC_FABRIC | SPINE1 | 10.1.252.1/32 |
| DC_FABRIC | SPINE2 | 10.1.252.2/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
