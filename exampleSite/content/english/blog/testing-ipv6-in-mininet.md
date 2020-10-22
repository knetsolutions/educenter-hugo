---
title: "Testing IPv6 in Mininet"
date: 2019-07-06T15:27:17+06:00
draft: false
# page title background image
bg_image: "images/backgrounds/page-title.jpg"
# meta description
description : "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. dolore magna aliqua. Ut enim ad minim veniam, quis nostrud."
# post thumbnail
image: "images/blog/post-1.jpg"
# post author
author: "KnetSolutions"
# taxonomy
categories: ["SDN"]
tags: ["IPv6", "RYU", "Mininet"]
# type
type: "post"
---

### 1. Indroduction

Generally we use IPv4 in all our networking devices/environment/test bed. But Some special cases requires IPv6 address. There are plenty of resources available in the internet for Mininet with IPv4.

In this blog, we discuss about using the IPv6 addresses in the Mininet Topology. We also discuss about, How to do Ping and TCP, UDP Traffic Tests (IPerf) with IPv6 addresses.

Some basic concepts of IPv6 addresses

#### A. IPv6 Link Local Address

Link-local address is a IPv6 unicast address that is valid only for communications within the network segment (link) or the broadcast domain. Link-local addresses are autoconfigured. Link local address prefix is ```FE80::/10 ```. 

Example Link local addresses are ```fe80::200:ff:fe00:1/64```,```fe80::200:ff:fe00:1/64```.


#### B. IPv6 Global Unicast Address

The global unicast address is globally unique in the Internet. Examples: ```2001::1/64```, ```2001::2/64```

## 2. Testing

Objective Lets use the RYU Controller with Mininet Single Topology(4 switchs).

####  Start the Ryu controller

Start the Ryu Controller with Simple Openflow 1.3 Switch application as below,

```ryu-manager ryu.app.simple_switch_13```

####  Create a Single Topology in Mininet

```sudo mn --controller=remote,ip=127.0.0.1 --mac -i 10.1.1.0/24 --switch=ovsk,protocols=OpenFlow13 --topo=single,4```

####  Verify the Host IPv6 addresses



In the mininet terminal, issue the below command,
```
    h1 ifconfig h1-eth0 
    h2 ifconfig h2-eth0 
    h3 ifconfig h3-eth0 
    h4 ifconfig h4-eth0
```


####  Ping Test between Host1 to Host2



ping6 utility is used for IPv6 Ping

Syntax :

```ping6 -I [Link local address | Unicast address]```

Example:

```h1 ping6 -I h1-eth0 fe80::200:ff:fe00:2```
