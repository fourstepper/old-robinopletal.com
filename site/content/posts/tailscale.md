---
title: "Tailscale - the magic mesh overlay network"
date: 2022-11-03T20:12:21+02:00
draft: false
tags: ["reviews", "VPNs", "security", "software"]
---

## Preface

For some time, I had a pretty nice networking setup at home.

The setup consisted of:

- pfSense on an older PC Engines APU2 board
- A semi-managed (VLAN-capable) Netgear GS108Ev3 8-port switch
- 2x TP-Link EAP 245 v3 access points, with the Omada controller software running on my NAS in Docker

To reach home from anywhere, I used Wireguard through a jump-box running in Hetzner Cloud. This would let me get through any kind of (in my case, CG) NAT, as my pfSense router would connect to the VPS, and all of my devices would then also connect to that same VPS.

Honestly, I liked the setup.

It was fast enough (I had 50/5 Mbps connectivity, so at least the Wireguard part was fast enough) and I understood the whole system quite well.  It also allowed me to discover and learn everything hands-on, which, at the time, I really appreciated.

## The discovery

For some unknown reason, I love learning and adopting new stuff, especially the stuff that strikes me as cool.

One day, I came across yet another article talking about how cool Tailscale was. I've heard about it before, didn't given it much thought, not then, not now, even if I could appreciate the simplicity and *coolness* of the solution.

"My VPN remote access setup works well enough, so why change it?"

*Why change it?*

## The change

Long story short, I moved. I moved to an apartment that wasn't furnished and had no internet connectivity when I came, with a promise of an optical cable to be installed soon (nice).

Did I mention the new place was 1/3 as big as the old one?

I moved all of my stuff, including my networking gear. On one beautiful day, a guy from the provider showed up with the ISP modem under his shoulder.

As soon as the connectivity was set up, I immediately looked for information on how to turn that fancy ISP modem into a simple bridge. Turns out, that isn't too easy to do, either, having to call the ISP, among other things.

While going through the manual for the modem, I looked at all of my networking gear and thought:

"That's quite a lot of relatively expensive equipment that I might not need here, and quite a lot of work that has to be done to set it up. I could maybe also save the full $3 of the VPS cost that I am paying right now."

"What was that Tailscale thing about again?"

## Enter Tailscale

If you don't know Tailscale, I will try to explain it real quick. If you want a better explanation, here is their [How Tailscale works](https://tailscale.com/blog/how-tailscale-works) article.

In essence, it's a mesh, overlay network between (ideally) all of your devices.

![==Tailscale - Mesh Overlay Network==](../../images/tailscale/mesh.png)

It utilizes a client part implemented on top of `wireguard-go` and a SaaS service.

The SaaS service is, in simple terms, composed of an authentication layer outsourced to popular OAuth2, OIDC and SAML providers (Github, Google etc.), "Tailscale Coordination Server", through which public key and metadata exchanges happen

![==Tailscale - Client to Coordination Server==](../../images/tailscale/coordination.png)

as well as "Encrypted TCP Relays" - so called DERP's (Designated Encrypted Relays for Packets), that can serve in cases when direct peer-to-peer connection over the public internet or LAN aren't feasible (such as when both devices are on separate LANs, without a routable public IP address). This let's you connect seamingly unconnectable devices, seamlessly.

![==Tailscale - DERP==](../../images/tailscale/derp.png)

To sum all of the above information up, we could say that:

- All devices within a "user" Tailscale network communicate with each other over the Wireguard protocol, therefore, the communication is encrypted
- Wherever any of the devices are hooked up to the internet and to a power supply, they will transparently connect to the "user" network, as if they were on the same LAN

## The over-engineered home network

Of course, being a nerd, I didn't just have a simple network with services running on different ports on my NAS.

No, for the nerd I am, all of my services are:

- Running on a domain from a subzone of my public domain (resolved courtesy of pfSense's DNS resolver)
- Behind a Traefik proxy in Docker
- With valid TLS certificates acquired through the beautiful [`acme-dns`](https://github.com/joohoi/acme-dns) DNS server.

Can Tailscale deal with this?

## The actual setup

When I first signed up for Tailscale, it prompted meto download a client for the platform I was browsing the Admin Console from.

I followed the instructions, and soon enough, a wild Tailscale client was ready on my computer.

As soon as I hit the Login button, it authenticated through my chosen OAuth2/OIDC/SAML provider in the browser and connected the device to my "Tailnet".

From there, I just had to add more devices!

Each device I added magically got a unique IP address assigned to it from the Shared Address Space ([RFC 6598](https://www.rfc-editor.org/rfc/rfc6598)), as well as a hostname (resolveable from other devices).

I am now 200 kilometers away from my home, pinging my NAS behind a CGNAT:

```shell
$ ping microserver
PING microserver.tailddae8.ts.net (100.100.180.43): 56 data bytes
64 bytes from 100.100.180.43: icmp_seq=1 ttl=64 time=32.770 ms
64 bytes from 100.100.180.43: icmp_seq=2 ttl=64 time=33.123 ms
64 bytes from 100.100.180.43: icmp_seq=3 ttl=64 time=40.650 ms
64 bytes from 100.100.180.43: icmp_seq=4 ttl=64 time=35.390 ms
```

One of the beauties of the above setup is that as long as a device is registered, it's IP address from the Shared Address Space stays the same. Why is that just wonderful?

Well, it allows me to set up some public DNS, for example for my PhotoPrism.

```shell
$ dig photos.home.robinopletal.com +short
100.100.180.43
```

Courtesy of Traefik, I could then reach my service as I was used to, comfortably over HTTPS:

```shell
$ curl -I https://photos.home.robinopletal.com
HTTP/2 200
content-security-policy: frame-ancestors 'none';
content-type: text/html; charset=utf-8
date: Thu, 03 Nov 2022 22:01:04 GMT
x-frame-options: DENY
```

Remember; this is all without ANY special networking gear or self-managed VPN endpoints.

**Fantastic!**

## The problems

I feel there are still some pitfalls with this setup, most of which aren't technical.

The biggest ones from my point of view are:

- Tailscale is a proprietary Software-as-a-Service dependency over which I have no control
- The Tailscale client on proprietary platforms (Windows, MacOS and iOS) is proprietary as well
- I have to rely on a third-party identity provider (custom SSO providers are available for Enterprise customers only)

I've decided these problems weren't big enough issues for me, but they may be for you.

## The conclusion

Over the last two months, I've happily been using Tailscale instead of any custom networking setup at home or in the cloud to access my home services remotely.

It works reliably, securely, and it's fast enough for my needs.

My home network is now more free of expensive networking gear; I've sold my TP-Link access points, and I will repurpose the APU2 for a different project.

I hope you found this writedown useful. If you have any questions or want to know more, don't hesitate to check the social icon links on my [homepage](https://robinopletal.com) to get in touch.

Until next time!

Robin
