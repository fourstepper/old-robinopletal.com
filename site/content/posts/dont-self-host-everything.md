---
title: "Don't self-host everything"
date: 2023-08-01T20:29:29+01:00
draft: false
tags: ["open-source", "free software", "self-hosting"]
---

Self-hosting Free, open-source software isn't just sunshine and roses.

Not for you, or the developers of the software

<!--more-->

---

In the open-source software realm, there seems to be a craze to **self-host it all** - from simpler use-cases such as cloud storage (such as Nextcloud or simple SMB) to quite a lot more difficult software to set up right, such as e-mail.

In this article, I would like to give a geek (_read: my_) perspective on why you should maybe dial the amount of services you self-host back, just a bit.

## A bit about software that I used to self-host

I feel like I have tried self-hosting quite a lot of software by now, but I will give a short list here:

- My personal [Synapse](https://github.com/matrix-org/synapse) server for Matrix
- [A WordPress e-commerce site](https://qweebs.com/) (now deceased)
- [acme-dns](https://github.com/joohoi/acme-dns) - a specialized DNS server specifically designed for the [ACME DNS-01 challenge](https://letsencrypt.org/docs/challenge-types/#dns-01-challenge)
- [Kanboard](https://kanboard.org/) - a kanban board
- Various [IRC](https://sr.ht/~emersion/soju/) [bouncers](https://github.com/znc/znc)
- A WordPress site for my mom's business (now deceased)
- The services I list below, that I still do self-host
- countless other services that I've considered self-hosting or did self-host, but ultimately didn't due to reasons I will try to present to you today

## What I still _do_ self-host

For transparency, I would like to share what I still do self-host and some reasons why.

**Publicly**

- **This website**
  - this might change in the near future - I am considering rewriting the site and putting it up either on Cloudflare Pages + Workers or Vercel
- **My personal Joplin server**
  - I would use [Joplin Cloud](https://joplinapp.org/plans/), but the pricing of it seems like a stretch - for just me and my girlfriend, I would have to show up with 16 EUR monthly, which is just way more than I can justify paying for a note taking app service right now
  - Instead I donate $5/mo on Joplin's Github page (down from $10 I was giving for quite some time, now shared between Joplin and [Thunderbird](https://www.thunderbird.net/en-US/))

**At home**

- [**Paperless-ngx**](https://github.com/paperless-ngx/paperless-ngx) - a must have for anyone who is either messy with their physical belongings (my case) or doesn't like the paper format for any other reason
  - Paperless maintainers [never came to a conclusion about how I could give them money](https://github.com/paperless-ngx/paperless-ngx/discussions/256), so I can't :(
- [**Immich**](https://github.com/immich-app/immich) - a wonderful photo and video back-up solution
  - Note for myself: I really have to start giving Immich money
- **A VOD platform for my movie collection** with the [Jellyfin front-end](https://jellyfin.org/)
  - it's pretty expensive not to self-host movies and TV shows that aren't all available on a single streaming platform.

## What did I stop self-hosting?

For each service I have stopped self-hosting or have considered self-hosting but ultimately didn't, I will include a reason why in nested bullet point(s).

Hopefully, this will help you make a more informed decision next time you have to urge to self-host _Yet Another Recipe Manager™_.

Also, make sure to read all the way to the bottom of this post for a few more, general reasons.

### Software I stopped self-hosting and why

- **My personal [Synapse](https://github.com/matrix-org/synapse) server for Matrix**
  - matrix.org, the company behind the Matrix protocol and the main drivers behind the reference server and client implementations don't really benefit all that much from me self-hosting my own Matrix server - at least not as much as they do from me giving them a couple bucks a month and using [element.io](https://app.element.io) instead.
  - the planet and my wallet both didn't really benefit from me running my own Synapse server - let's just say there is more efficient software out there, especially if you want join conversations happening on all those bigger rooms living on all those bigger servers
- **My WordPress e-commerce site**
  - It was great excercise running Wordpress with Woocommerce for e-commerce on the side, but quite honestly, the benefit of using a fully Free software solution for e-commerce quickly becomes a myth once you need to receive payments - you will most likely integrate [Stripe](https://stripe.com) or PayPal anyway
  - If I wanted to make an e-commerce site today, I would probably try to offload as much as possible to Stripe (like Checkout, tax calculations etc.) and create the rest from scratch with something like NextJS on Vercel
  - It's PHP all the way and doesn't run with any other database than MariaDB/MySQL :(
- **VPN (for accessing self-hosted at home)**
  - this is a bit controversial even for me, but I decided to get rid of my pfSense router with a Wireguard server and switched to Tailscale to access the few self-hosted services I run at home - you can read a bit more about my the why in my semi-recent ["Tailscale - the magic mesh overlay network"](https://robinopletal.com/posts/tailscale/) post

### Software I never even started self-hosting and why

- **E-mail**
  - I have never really cared about the "problems with self-hosting e-mail" that are so widely cited (not only on) Reddit
  - I use [posteo.de](https://posteo.de) - my e-mail runs fully on green energy, is (supposedly) encrypted at rest and backs all of my e-mail, calendar, tasks and contacts at 1 EUR/month
- [**Miniflux**](https://miniflux.app/) - the "minimalist and opinionated RSS feed reader"
  - Free software that's performant, with full import/export functionality that offers [paid hosting](https://miniflux.app/hosting.html). At $15/year, the value is crazy good.
- **Git service and CI/CD**
  - I have used Github and Github Actions for quite a long time and dabbled with [Sourcehut](https://sourcehut.org/) for a bit as well. I have recently started migrating everything from Github to [Codeberg](https://codeberg.org/) and I am loving the platform. I think I will write a separate article about the capabilities of Codeberg soon, and why you should consider it for your Git workflows as well. Among other things, they pushed me over the edge to write this article with their own article titled ["Community maintenance matters"](https://blog.codeberg.org/community-maintenance-matters.html)
- **[Mastodon](https://joinmastodon.org/)**
  - Here, the reason is simple - I just didn't feel like self-hosting a social media server

## Closing words

It's entirely possible (and quite likely) that you might disagree with my stance on self-hosting.

**However**, please allow me a couple paragraphs to summarize my reasoning here before you close this article.

It's quite well known that Free and open-source software (especially software targeted at individuals) isn't too financially sustainable - developers of this software either have to write it in their spare time during off-hours or have to live a modest life to sustain themselves off of the small amount of money they receive in donations.

I think this is _unfair_ for the value they are putting out into the world - and in the end, _unfair_ to us when they eventually decide to drop the project entirely.

I guess most of us (even though I consider myself rather fortunate) aren't made of money and can't just _willy nilly_ throw money at both the software developers of _Yet Another Recipe Manager™_ and at our VPS provider to self-host it.

We will most likely have to make an either-or choice.

If a developer provides a paid hosting for the software they wrote, like [Miniflux does](https://miniflux.app/hosting.html), everyone wins if I choose to pay for such hosted version instead of hosting it myself:

- I get access to great software that respects my privacy and [freedoms](https://writefreesoftware.org/learn/four-freedoms), hosted by the person who knows the software intimately
- I don't have to burn additional electricity hosting the software myself, when the official author most likely does a better job at this from an efficiency perspective
- I don't have to worry about screwing something up - it just works™
- The developer is has an incentive to keep maintaining and adding features to said software that I enjoy already
- Everyone who can't, for any reason whatsoever offer any financial compensation or wants to hack on the software to improve their skills gets to use, modify and distribute that maintained and improved software for free

I hope that next time you stumble upon your new _Yet Another Recipe Manager™_, you will consider using _Yet Another Recipe Manager™'s cloud_ offering as well. Sometimes, it won't work for you - but oftentimes, it just might.

You could save the planet some energy and your wallet some money by not running that underutilized VPS; and you might just as well save some niche-but-great Free software project from going unmaintained because it didn't pan out sustainable for the developer to continue maintaining it.

Thanks for reading this post and until next time!
