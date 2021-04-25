---
title: "Rethinking the DNS Infrastructure"
date: 2021-04-25T17:14:50+02:00
draft: false
---
### The what

At our company, we have been running two BIND authoritative nameservers. As far as functionality goes, BIND provided everything required and we were nowhere near being able to feel any performance bottlenecks.

So why switch, if everything is going great?

### The why

Well, not *everything* has *always* gone great.

Any changes done to the DNS were done by humans - this includes; creating, copying and editing zone files and `named.conf` manually, manually running zone tests to make sure that everything is okay and then restarting the service in question, also manually.

Even though this might seem like a banality at first, time has proven that even the best people make mistakes every once in a while, be it big or small, getting the system(s) into an inconsistent or (worse) non-functional state. It was also relatively problematic to audit any changes made, since the changes were done by hand over SSH, on the CLI.

### The idea

To solve this, we have decided to switch to using [Knot](https://www.knot-dns.cz/), GitLab CI (with Ansible tests powered by [molecule](https://github.com/ansible-community/molecule)), Ansible and AWX (the upstream of Ansible Tower) to manage our DNS.

The goals were the following:

1) Remove any console human interaction on the production systems
2) Test everything in CI before even letting Ansible touch the servers, from installing Knot, configuring it and making sure it works as expected
3) Utilize Git and AWX to increase the auditability of any changes made

### The how

On GitHub I have found [ansible-role-knotauth](https://github.com/vavrusa/ansible-role-knotauth) by Marek Vavruša, which at the time I forked it was able to install Knot and, at a basic level, configure it's `knot.conf` configuration file, which was a great starting point.

To minimize mistakes and to make the role and our playbooks easy to use for anyone, we have extracted all zones' configuration as variable files. A snippet can be see below, with the full example available [here](https://github.com/fourstepper/ansible-role-knotauth/blob/master/zone_vars/example.com.yml)

```
zone_global_ttl: 600

zone_records:
  SOA:
  - domain: nameserver.example.com. root.example.com.
    expire: '604800'
    minimum: '300'
    refresh: '21600'
    retry: '3600'
    serial: 2020102008
  NS:
  - domain: '@'
    ns: nameserver.example.com
  CNAME:
  - domain: hello
    target: hello.differentexample.com.
  A:
  - domain: test
    ip: 10.150.88.4
  - domain: "@"
    ip: 10.99.68.4
.
..
```

The benefit of having the zone configuration in a YAML structure over a [zone file](https://en.wikipedia.org/wiki/Zone_file) is in easy reusability.

For example, outside of the role we have made a Jinja2 template for a script. When the script is run, it goes and checks if the server is responding to all of the defined records correctly, across all zones we manage - all within CI.

This gives us an opportunity to catch problems as duplicates, syntax errors not caught by [kzonecheck](https://github.com/fourstepper/ansible-role-knotauth/blob/master/tasks/zones_configuration.yml#L31) and to test if the system is even able to respond at all.

### The ugly

The only major downside in the new setup is the speed. When a record is to be edited, it takes roughly 30 minutes for the changes to get in to production on two servers for around 200 zones.

We have decided that reliability and auditability come first, though.

### The future

A benefit of a setup like this is that going into the future of container-based workloads, it won't lose it's value. It doesn't sound hard to rewrite the playbook a little to pack all of the configuration into a container within CI and just ship that out to a container registry to get pulled by Kubernetes or a different other container orchestrator later.

Scalability is also possible, pushing to any number of servers, joining forces with the likes of `nginx` and `keepalived` for load balancing and increased redundancy. Modularity of the role towards the rest of the ecosystem is open.
