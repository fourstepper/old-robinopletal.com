---
title: "Open-Source Summit EU 2022 - what have you missed?"
date: 2022-09-20T16:12:21+02:00
draft: false
---

## Introduction

![==Open-Source Summit at the Convention Centre Dublin==](../../images/ossummiteu2022/ossummit-convention-center.jpeg)

This year, I had the chance to visit the Open-Source Summit EU in Dublin and I decided to write a short post highlighting the things that were most interesting to me and hopefully to you, too.

So, what did you miss?

## Tuesday

(13/09/2022)

### Confidential Computing and Privacy-Enhancing Technologies - Mike Bursell, Profian

We sort of know how to isolate workloads running on a single host from one another, using VMs, containers, whatever...

...but how can we hide our workload from the host it's running on?

This was a really interesting overview of technologies that can help us with this today, both implemented purely in software and with use of special hardware extensions present in modern CPUs, such as the Intel Software Guard Extension (SGX) or the AMD Secure Encrypted Virtualization (SEV)

Part of the talk also involved the [enarx project](https://enarx.dev/), which is a framework for running applications in Trusted Execution Environments, that takes advantage of the above-mentioned hardware-based memory encryption features and provides other features, such as workload attestation among other things.

I recommend you take a look at enarx [here](https://enarx.dev/docs/Start/Enarx)!

### Linux Tracing Techniques - Vandana Salve, Prasme Systems

I've never really had much exposure to using tools such as `lsof`, `strace`, and `ptrace`, but this talk motivated me to use them next time I encounter an application that isn't behaving as I would expect.

### Drive Your Business with Open Source Sponsorship - Wolfgang Gehring, Mercedes-Benz Tech Innovation

Wolfgang from Mercedes-Benz Tech Innovation came with a talk about how they deal with the following issue:

![==Dependency - the modern infrastructure problem (xkcd)==](https://imgs.xkcd.com/comics/dependency.png)

In the talk, he went over the similarities of the OpenSSL project and the Log4j library that caused two of the most infamous bugs in recent history - [The Heartbleed Bug](https://heartbleed.com/) and the [Log4Shell vulnerability](https://en.wikipedia.org/wiki/Log4Shell), highlighting the fact that in both cases the maintainers of these projects maintained them in their free time, while having a full-time job "on the side".

Wolfgang presented how sponsoring open-source projects benefits Mercedes-Benz in the long run, as developing and maintaining comparably well-written projects from scratch would end up being way more expensive.

He also shared some tips on how to choose the right projects to support (ideally the ones the company sponsoring them depends on the most, and that no larger company is backing already), as well as the possible organizational challenges one could encounter trying to implement a sponsoring program at their company.

## Wednesday

(14/09/2022)

### Distributed Tracing Integration with OpenTelemetry and Knative - Daniel Oh, Red Hat

Daniel showed off many off-the-stove technologies, deploying to `OpenShift` using [`Quarkus`](https://quarkus.io), scaling up from and down to zero in as "serverless" fashion using [`Knative`](https://knative.dev/docs/), and from there collecting traces from that serverless application using a Jaeger endpoint.

While the whole demo was very interesting, I was most inspired by the use of [`Knative`](https://knative.dev/docs/) and what value it (or other similar autoscalers such as [`KEDA`](https://keda.sh/)) could bring to our developers at Heureka Group, especially in conjunction with an event broker such as `RabbitMQ`.

### The Challenges and Solutions of Open Edge Infrastructures - Ildiko Vancsa, Open Infrastructure Foundation

An interesting talk about the challenges of edge infrastructure, such as day 2 operations, failover and running mixed workloads (K8s and VMs), as well as presenting a new cloud infrastructure platform called [`Starlingx`](https://www.starlingx.io/)

Here is an overview of the `starlingx` infrastructure stack:

![==Image of the StarlingX Architecture==](../../images/ossummiteu2022/starlingx.jpg)

If you are into edge, IoT, other similar workloads, make sure to [check it out](https://www.starlingx.io/)!

## Thursday

(15/09/2022)

### Linus Torvalds in Conversation with Dirk Hohndel, Chief Open Source Officer, Cardano Foundation

![==Image of Linus Torvalds talking to Dirk Hohndel==](../../images/ossummiteu2022/linus-with-dirk.jpeg)

An interesting but rather short conversation between Linus and Dirk Hohndel from the Cardano Foundation.

The two most interesting topics included:

- Adoption of the ARM architecture
    - both on desktops and servers; Linus mentioned that he has been using an M1 Mac for Linux kernel development for some time now and is quite satisfied with it.
    - He also mentioned he thinks it's important for ARM to be usable on kernel developers' desktops to drive fixes and features for the architecture in the Linux kernel itself, which will in turn help broader adoption in the server world as well.
- Rust in the Linux kernel
    - Linus is generally for adding Rust into the kernel and mentioned that is mostly a "people" problem rather than a technical problem, but he thinks it will go through in the end.

### Scaling SLOs with Kubernetes and Cloud Native Observability - George Hantzaras, Citrix Systems

This talk from George the one I looking looked forward to the most for a couple of reasons:

1. At Heureka, we have already implemented SLOs and I wanted to see how other people go about this
2. To see what technologies we might be missing out on
3. To validate our implementation compared to the industry

Some of the things I've taken home include:

- The promised customer facing SLO should be lower than the internal target SLO.
- On-call alerts don't have to be (or even shouldn't be) directly connected to the SLOs themselves.
    - If they are, they should be set to the internal targets rather than the promised SLAs.
- It's important to base customer-facing SLOs based on their expectations instead of what we as engineers think is "achievable".
    - Does the customer care that we can achieve 99.99% availability? Maybe they just expect guaranteed 99% availability.
- An [OpenSLO specification](https://github.com/openslo/openslo) for defining SLOs exists. Maybe we should help move [slo-generator](https://github.com/google/slo-generator) towards this specification?
- SLOs, as many other things, are an ever-evolving process. Don't stop improving them!

## Friday

(16/09/2022)

Unfortunately, I couldn't attend any talks on Friday because of my flights.

Instead, here is a picture I took of the Liffey River in Dublin!

![==Image of the view on the Liffey river==](../../images/ossummiteu2022/dublin-riverview.jpg)

## Thank you!

And that's it! Thank you for reading this summary of the Open-Source summit to the end. I hope the information was useful to you.

If any of the above topics caught your interest, the Linux Foundation promised they will upload all the sessions to their [YouTube channel](https://www.youtube.com/user/TheLinuxFoundation) 30 days after the event (which will be in the middle of October, 2022).

If you would like to check out what else you might have missed, take a look at the [schedule of the Open-Source Summit](https://events.linuxfoundation.org/open-source-summit-europe/program/schedule). Those sessions will also be available on the YouTube channel mentioned above.
