---
title: "Dealing with a Google Kubernetes Engine Cluster Outage"
date: 2022-03-31T09:25:21+02:00
draft: false
---

This post was originally posted to the [heurekadevs.cz blog](https://www.heurekadevs.com/dealing-with-a-google-kubernetes-engine-cluster-outage).

## Intro
As the infrastructure team at Heureka, we are responsible for providing certain infrastructure components as a service (Infrastructure as a Service, or IaaS) to our developers. One such service is Kubernetes, for which we use the Google Kubernetes Engine, which serves as the core for many of our services, both in our “legacy” on-prem and in the cloud.

Everything was running smoothly for a few months, until one day (luckily not while in full production yet); our pre-production (staging) cluster went down.

This is how the events went **down**.

## Summary
One day, out of nowhere, our preemptible node pools on our pre-prod cluster went down, rendering the cluster unusable. Trying to replace the preemptible node pool with another didn’t help.

With no apparent fixes in sight and in slight panic, we turned to our cloud partner’s support for assistance. After over two weeks of investigation by the Google team called in to help by our cloud partner, they found that a misconfigured [OPA Gatekeeper](https://www.openpolicyagent.org/) was to blame for this behavior - Let’s talk about what happened a bit more.

![Open Policy Agent logo](../../images/dealing-with-a-gke-outage/opa-logo.webp)

## Root Cause and Contributing Factors
In Kubernetes, we run [OPA Gatekeeper](https://www.openpolicyagent.org/) to enforce a basic set of rules for pods (basically [Pod Security Policies](https://kubernetes.io/docs/concepts/policy/pod-security-policy/) for the “new age”).

The Gatekeeper uses a mechanism called a Validating Webhook to check for the configuration of resources and rejects them if they are not compliant with the set of rules that you define. The validation itself is done by Gatekeeper pods to which these requests come for evaluation from that Validating Webhook.

We turned all of those rather strict validation rules **off** on both the **gatekeeper-system** namespace, where [OPA Gatekeeper](https://www.openpolicyagent.org/) lives, as well as on the **kube-system** namespace, which is mostly automatically operated by Google as part of the GKE service. That namespace is home to critical cluster components such as the Kubernetes API server, the CSI, CNI, and more.

If those namespaces had those strict rules **turned off**, why are we talking about them?

Well, removing a namespace from some rules, or all the rules, is one thing. Totally disabling the Validating Webhook from those namespaces is a different story.

Essentially the following sequence of unfortunate events led to the downtime:

1. Our preemptible node pools started being replaced (this happens every 24 hours and is expected, more on preemptible nodes and how they work [here](https://cloud.google.com/compute/docs/instances/preemptible)).
1. The nodes were replaced in such a succession that no Gatekeeper pods were running at the same time. This meant that the Gatekeeper pods themselves couldn’t start, as there were no other Gatekeeper pods running at that time to validate those requests.
1. All activities on the kube-system namespace essentially halted as well, as they also couldn’t really be validated. Thus the required DaemonSet pods couldn’t start and the nodes never became Ready.

As the kube-system namespace was now effectively blocked by the gatekeeper webhook which couldn’t be validated as the Gatekeeper was down, some of the GKE automatic processes failed and the preemptible nodes (that, by nature, rotate every 24 hours) didn’t shut down properly, nor were new ones spun up and connected to the cluster.

![Google Kubernetes Engine logo](../../images/dealing-with-a-gke-outage/gke-logo.png)

## Impact
Teams currently adopting the cloud were disrupted in their operations, especially the ones that were only using the pre-prod cluster.

## Lessons Learned

**What went well**

* This made us realize that it’s necessary to be able to just delete the whole cluster and recreate in case of a catastrophic failure, and therefore using PVC’s for important production data (such as a database) should be discouraged, as those PVC’s could be trashed in case of a major problem with Kubernetes as whole.

**What went wrong**

* We were able to quickly notice the issue, but we wrongly concluded that it was not on our side of things and there wasn’t much we could do about it.
* We were unable to resolve the issue on our own without the help of an external party, while the actual root cause wasn’t even considered or found when investigating the outage.
* We didn’t have any actual SLAs for support with our cloud partner or Google itself, so support from both parties came on a best effort basis. This was because no production workloads were running on these clusters when this incident happened.
* We had no idea what we would do if this was an actual production cluster. No disaster recovery was ready- again, this was because no production workloads were running on these clusters when this occurred.

**Where we got lucky**

* We experienced this early-ish in the cloud adoption process, where we had quite a lot of space to let the issue drag.
As we used preemptible nodes, the issue presented itself much sooner than it otherwise would.
The Kubernetes API server continued to work, so we and the support engineers could reach and inspect the cluster from the inside during the incident.
