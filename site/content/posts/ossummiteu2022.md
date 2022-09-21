---
title: "Open-Source Summit EU 2022 - what have you missed?"
date: 2022-09-20T16:12:21+02:00
draft: false
---

## Introduction

![==Open-Source Summit in the Convention Centre Dublin==](../../images/ossummiteu2022/ossummit-convention-center.jpeg)

This year, I've had the chance to visit the Open-Source Summit EU in Dublin and I've decided to write a short post highlighting the things that were most interesting to me, and hopefully to you.

Unfortunately, I won't be able to share all of the many interesting talks I've been to, as that would yield a too-long blog post, but here we go:

So, what have you missed?

## Tuesday

(13/09/2022)

### Confidential Computing and Privay-Enhancing technologies - Mike Bursell, Profian

We kind of know how to isolate workloads running on a single host from one another, using VMs, containers, whatever...

But how can we hide our workload from the host it's running on?

A really interesting overview talk on technologies that can help us with this today, both implemented purely in software and with use of special hardware extensions present in modern CPUs, such as the Intel Software Guard Extension (SGX) or the AMD Secure Encrypted Virtualization (SEV)

Part of the talk also involved the [enarx project](https://enarx.dev/), which is a framework for running applications in Trusted Execution Environments, making advantage of the above hardware-based memory encryption features and providing other things, such as attestation and other things.

I recommend you take a look at enarx [here](https://enarx.dev/docs/Start/Enarx)!

### Linux Tracing Techniques - Vandana Salve, Prasme Systems

I've never really got much exposure to using tools such as `lsof`, `strace` and `ptrace`, but this talk motivated me to use these tools next time I will encounter an application that isn't behaving at all as I would expect it to.

### Drive Your Business With Open Source Sponsorship - Wolfgang Gehring, Mercedes-Benz Tech Innovation

Wolfgang from Mercedes-Benz Tech Innovation came up with a talk about how they try to help the following issue:

![==Dependency - the modern infrastructure problem (xkcd)==](https://imgs.xkcd.com/comics/dependency.png)

In the talk, he went over the similarities of the OpenSSL project and the Log4j library that caused two of the most written-about bugs in recent history - [The Heartbleed Bug](https://heartbleed.com/) and the [Log4Shell vulnerability](https://en.wikipedia.org/wiki/Log4Shell), hightlighting the fact that in both cases the maintainers of these projects maintained them in their free time, while having a full-time job "on the side".

Wolfgang presented how sponsoring open-source projects benefits Mercedes-Benz in the long run, as developing and maintaining comparably well-written projects from scratch would end up being way more expensive.

He also shared some tips on how to choose the projects to support (ideally the ones that the company depends on the most, **and crucially, that no bigger company is behind already**), as well as the possible organizational challenges one could encounter trying to implement a sponsoring program in their company.

## Wednesday

(14/09/2022)

### Distributed Tracing Integration with OpenTelemetry and Knative - Daniel Oh, Red Hat

Daniel showed off many off-the-stove technologies, deploying to `OpenShift` using [`Quarkus`](https://quarkus.io), scaling up from and down to zero in as "serverless" fashion using [`Knative`](https://knative.dev/docs/), and from there collecting traces from that serverless application using a Jaeger endpoint.

While the whole demo was very interesting, I've been most inspired by the use of [`Knative`](https://knative.dev/docs/) and what value it (or other similar autoscaler such as [`KEDA`](https://keda.sh/)) could bring to our developers at Heureka Group, especially in conjunction with an event broker such as `RabbitMQ`.

### The Challenges and Solutions of Open Edge Infrastructures - Ildiko Vancsa, Open Infrastructure Foundation

An interesting talk about the challenges of edge infrastructure, such as day 2 operations, failover and running mixed workloads (K8s and VMs), and a new cloud infrastructure called [`Starlingx`](https://www.starlingx.io/)

Here is an overview of the `starlingx` infrastructure stack:

![==Image of the StarlingX Architecture==](../../images/ossummiteu2022/starlingx.jpg)

If you are into edge, IoT or other similar workloads, make sure to [check it out](https://www.starlingx.io/)!

## Thursday

(15/09/2022)

### Linus Torvalds in conversation with Dirk Hohndel, Chief Open Source Officer, Cardano Foundation

An interesting but rather short conversation of Linus with Dirk Hohndel from the Cardano Foundation.

The two most interesting topics included:

- Adoption of the ARM architecture
    - Both on the desktop and the servers. Linus mentioned that he is using an M1 Mac for Linux kernel development for some time now, and is quite satisfied with it.
    - He also mentioned he thinks it's important for ARM to be usable on desktops of kernel developers to drive fixes and features for the architecture in the Linux kernel itslef, which will in turn help broader adoption in the server world as well.
- Rust in the Linux kernel
    - Linus is generally pro adding Rust into the kernel, and mentioned that this is mostly a "people" problem rather than a technical problem, but in the end he thinks this will go through.

### Scaling SLOs with Kubernetes and Cloud Native Observability - George Hantzaras, Citrix Systems

This talk from George was one that I looked forward the most for a couple of reasons:

1. At Heureka, we have implemented SLOs already and I wanted to see how other people go about this
2. Look at what technologies we might be misisng out on
3. Our implementation validation

Some of the things I've taken home include:

- The promised, customer facing SLO should be lower than the internal target SLO
- On-call alerts don't have to be (or even shouldn't be) directly connected to the SLOs themselves
    - if they are, they should be set to the internal targets rather than the promised SLAs
- It's important to base customer facing SLOs based on their expectations instead of what we, as engineers, think is "achieveable"
    - Maybe the customer doesn't care that we can do 99.99% availability? Maybe they just expect guaranteed 99% availability
- An [OpenSLO specification](https://github.com/openslo/openslo) for defining SLOs exists - maybe we should help move [slo-generator](https://github.com/google/slo-generator) towards this specification?
- SLOs, as many other things, are an ever-evolving process. Don't stop improving them!

## Friday

(16/09/2022)

Unfortunately, due to my flight schedule I wasn't able to attend any talks on Friday.

Instead, here is a picture I took of the Liffey River in Dublin!

![==Image of the view on the Liffey river==](../../images/ossummiteu2022/dublin-riverview.jpeg)

## Thank you!

And that's it! Thank you for reading this summary of the Open-Source summit towards the end, I hope any of the information here was useful to you.

If any of the above topics caught your interest, the Linux Foundation promised they will upload all the sessions publicly to their [YouTube channel](https://www.youtube.com/user/TheLinuxFoundation) 30 days after the event (which will be in the middle of October, 2022).

If you would like to check out what else you might have missed, take a look at the [schedule of the Open-Source Summit](https://events.linuxfoundation.org/open-source-summit-europe/program/schedule). Those sessions will also be available on the YouTube channel mentioned above.
