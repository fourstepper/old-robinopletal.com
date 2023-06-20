---
title: "Sane Linux Desktop"
date: 2023-06-20T20:29:29+01:00
draft: false
tags: ["linux", "desktop"]
---

## Preface
Today, I would like to talk about Linux.

Specifically, Linux on the desktop.

More specifically, Linux on the desktop, even for people that think that they might be missing out on something their current environment provides them.[^1]

The reason I call this blog post "Sane Linux Desktop" is twofold:
1. Linux desktop will not drive you insane
2. I believe that you don't have to be insane at Linux (or computers in general) to use Linux as your operating system

The goal of today's blog post is to show that Linux and supported applications can work well, without any extreme tinkering, for most people and most use-cases.

**I will disclose right away that this is an opinionated post**, but at the same time, I will try to cover everything that **most** people need to do their job (like office tools) or to go on with their life (chat messaging, watching movies etc.).

So, without any further ado, let's jump right into it!

## The basics
Before we start installing tons of applications for all different use-cases, let's start with the basics.

We need:
- a Linux distribution (if you don't know what a distribution is, don't worry about it)
- we need a web browser
- and we need a source of applications

### Linux distribution
There are many Linux distributions out there, and today, we will choose **Fedora**[^2] out of all of them.

The reasons for which I chose Fedora are the following:
- It provides an easy to use graphical installer
- It ships new software and features relatively quickly while remaining stable
- Upgrading Fedora is reliable and doesn't require any special technical knowledge
- It is built and controlled by the community, for the community

Installing Fedora is at least as simple as installing Windows.

You can download the Fedora Media Writer, which will take care of creating a bootable USB for you, [here](https://fedoraproject.org/workstation/download/).

### Browser

Once we boot into our fresh Fedora installation, we will most likely need a browser - lucky for us, Fedora ships the Firefox browser which we will be using with the OS already.

To launch it, press the Windows key (otherwise known as the Super key in Linux), type "firefox", and hit enter.

Now, why don't we install something "normal", like Chrome? Well, because:

- Firefox is already there
- Firefox, I would argue, is the most cross-platform browser out there in regards to bookmarks and history synchronization through the Mozilla account
- Firefox is treated as a first class citizen on Linux
- The Linux desktop is treated as a first class citizen by Firefox
- It's entirely [Free software](https://writefreesoftware.org/learn/)

### A note on password management

Most people nowadays use their browser to save and synchronize their passwords between devices - this is, generally, fine - as long as your Mozilla (for Firefox) or Google (for Chrome) have a strong password themselves.

I would however suggest using a dedicated application dedicated only to your passwords.

I wrote a whole [blog post on password managers](https://robinopletal.com/posts/password-managers/), however today I will, without any affiliation and as a paying customer, recommend [Bitwarden](https://bitwarden.com/).

- it's intuitive and easy to set up across all your devices
- it's open source and security audited
- it has optional family password sharing features, for when you need that
- it can be self-hosted, however the cloud service is cheap (free for core features) and great
- it has a seamless import/export mechanism paired with guides for backup purposes, as well as for importing your current passwords

### Source of applications
In Fedora, and on most Linux distributions in general, there is a plethora of ways to install software.

As we will be primarily installing graphical applications today, let's install them through the Fedora app store, called simply `Software`.

You can launch `Software` the same way as you did Firefox - using the Windows (Super) key, typing "software" and hitting enter.

One thing we will most likely want to do before we start using `Software` fully is adding an extra repository from where we can install software called Flathub.

It's possible to only use the built-in repository, however some software I like to use, such as Spotify, is not available there - let's install Flathub then.

You can do that by going to https://flatpak.org/setup/Fedora and clicking on the blue `Flathub repository file` button - once that's done, click on the downloaded file and it will automatically take you to `Software`, where you just have to click install.

That's it!

Now let's go over some programs that you might need to do your day-to-day computing.

## Office work

Most, if not all of us, will do some kind of office work on our computer.

### E-mail
For your e-mail on the desktop, I would recommend using **Thunderbird**, which you can find it in `Software`. Other available clients are much less mature and feature-full than Thunderbird.

Setting up your account in Thunderbird should be very easy with their built-in account wizard.

The only extra thing I would encourage you to install to make Thunderbird even better is the "Thunderbird conversations" extension. It conveniently converts every e-mail conversation into an easily-readable thread, like this one:

![Thunderbird Threads](../../images/sane-linux-desktop/thunderbird_threads.png)

To install this extension, click on the Settings wheel in the bottom left, click on Add-ons and Themes and search for "Thunderbird conversations" - then just click on Add to Thunderbird.

### Calendar, Contacts and To-do

**Thunderbird** is not only great of e-mail, but for calendars, contacts and todos as well.

If the automatic account wizard hasn't added these for you automatically, or you are unsure on how to set-up either of the above manually, feel free to consult the [Thunderbird knowledge base](https://support.mozilla.org/en-US/products/thunderbird).

##### Online alternatives

If you dislike having a dedicated e-mail and calendar application, by all means, feel free to use online services such as Gmail and Google Calendar instead.

### Office apps

Almost all of us sometimes need to edit or create a Word or an Excel document, or perhaps a PowerPoint presentation. What can we use?

Here, **OnlyOffice** would be my recommendation - you can, again, find it in `Software`.

- it provides a straightforward user interface similar to it's Microsoft counterpart
- it boasts great compatibility with standard Microsoft Office file formats
- it's Free and open-source

Only if you are a heavy, HEAVY power-user of Excel, for example, you might find yourself struggling with OnlyOffice. If you are in such a group of people, Linux might be a bit more difficult for you to adopt, as Linux isn't supported by the Microsoft Office software.

##### Online alternatives

There are two main alternatives to OnlyOffice available online:
- Microsoft Office 365 online
- Google Documents

I won't compare the two, there are plenty of constantly-updated comparisons online.

##### Honorable mention: LibreOffice

Here, I wanted to give a short, honorable mention to LibreOffice. Even though it's user interface isn't as shiny and it's not as straightforward from the get-go, it's a powerful Free and open-source tool to get the job done.

## Company chat applications

If you are in virtually any company today, you are likely using one of the following applications to communicate with your colleagues:
- Slack
- Microsoft Teams
- Mattermost
- Discord

All of the above-mentioned apps are available on Linux and are available from the Flathub repository we installed earlier - just go and find them in `Software`!

## Video conferencing (including screensharing)

Most videoconferencing solutions today have a web-browser native version and if they do, it's usually the best way to use that platform.

This includes:
- Google Meet
	- works in Firefox out of the box
- Zoom
	- works in Firefox out of the box
- Discord
	- works including audio&camera in the desktop application, for screensharing, Firefox is a better fit
- Teams
	- works in a Chromium-based[^3] browser - by default, only audio & video works, however screensharing is an easy fix
	- for screensharing, open [chrome://flags/#ozone-platform-hint](chrome://flags/#ozone-platform-hint) in your Chromium-based browser and choose "Wayland" from the drop-down menu

## Media (audio and video)

### Tricks

The single tricky part in Fedora that requires "terminal intervention" is installing multimedia playback in general, due to software patennts and non-free codecs needed to play some of the media back.

#### Media libraries

Let's install the required media libraries first.

Open the terminal by pressing the Windows (Super) key, type "terminal" and hit enter.

Then, paste the following commands, line by line - if prompted for your password, enter it:

```bash
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf group install --with-optional Multimedia
```

#### Drivers (optional)

For better performance, it's best if video decoding is done by the graphics card instead of the CPU. If you do or don't need additional specific drivers to hardware decode video will be dictated by your GPU.

Please read [this part of the Fedora wiki](https://fedoraproject.org/wiki/Firefox_Hardware_acceleration#Video_decoding). If you are unsure about what to do, don't hesitate to ask the community through one of the channels [here](https://www.fedoraproject.org/workstation/community/), on Reddit, or elsewhere.

### Now that we have that out of the way...

**Videos**
- Netflix works
- YouTube works
- ... virtually any video on the internet works
- VLC media player is available from `Software` and can play back any local videos and music

**Music**
- Spotify works out of the box and is available from `Software`
- Lollypop is a pretty, Free and open-source dedicated music application for any local music collection

## Gaming

Gaming on Linux has been a hot topic for quite a while now, and hugely pushed forward by Valve's efforts (thank you!)

This means that you can play both Linux native games, as well as many Windows native games. The best compatibility "checker" for each title is the [ProtonDB](https://www.protondb.com/) - just search for your game.

There are two major platforms through which you can install games; Steam and Lutris, both available in `Software`.

If you need extra guidance on how to use either platform, it's best to search on the internet for the latest information.

Steam is as easy as logging in with your Steam account and playing a game.

If one of your games can't be installed right away, consult ProtonDB and enable compatibility in Steam > Settings > Compatibility > Enable Steam Play for all other titles.

### Everything else

There is a ton of software left to be discovered either through the `Software` application or through [Flathub](https://flathub.org/apps/search/). Enjoy the hunt for your new favorite program!

## Community support

Briefly, I wanted to touch on the community around the Linux desktop. Simply, it's an amazing resource. No other widely used operating system has such passion around it.

If you need help or get stuck, please try finding an answer online or ask for help

Here are some places you can do just that:

- [Fedora forums](https://discussion.fedoraproject.org/tag/workstation)
- [Fedora chat](https://chat.fedoraproject.org/#/welcome)
- [Fedora subreddit](https://www.reddit.com/r/Fedora/)

## Feel free to suggest changes

At the top of this post, right under the title, there is a neat little `Suggest changes` link.

If you click it, you can directly edit this post on Github and send a pull request with your changes.

I will be happy to include your change if it's a good one!

## Closing words

Even though running Linux as your operating system isn't quite as straight-forward as just using the OS that came with your computer by default, it's definitely been made way easier than it was in the past.

By it's community nature, Linux on the desktop can be freeing.

It doesn't try to grab your attention. It doesn't try to stop you from uninstalling Microsoft Edge. It doesn't force any preinstalled garbage phone-like games on you in the Start menu.

It doesn't get in the way, and gives you back the full power of your computer to use.

I hope it will serve you well.

Thanks for reading, and see you in the next post!

 [^1]: Technically, they might be right. But most people, in my opinion and experience, are just scared of making the switch because they "heard" there are problems.
 [^2]: I feel like that's important to say here that the choice of distribution matters quite little in the general scheme of things - most of Linux distributions differ only very slightly, and all of the major ones are technically a good choice.
 [^3]: Chromium is the base open-source engine used by a few browsers, such as Chrome, Brave, Edge, Opera and others
