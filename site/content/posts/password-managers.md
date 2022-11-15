---
title: "Password managers - Bitwarden vs pass vs KeepassXC"
date: 2020-12-26T17:29:29+01:00
draft: false
tags: ["reviews", "password-managers", "security"]
---

Over the past few months I have taken some time to tinker with a few password managers to find out which suits my needs the best and to find out the pros and cons of each one of them.

In case you don't know, a password manager is a piece of software that holds all of your passwords and is itself protected with one master password or some other cryptographic method (or a combination of both)

I have tried the following password managers over the course of three months:

- [Bitwarden](https://bitwarden.com/)
- [Password Store](https://www.passwordstore.org/) (pass)
- [KeepassXC](https://keepassxc.org/)

The main reason for the selection of these particular password managers was that all of them operate quite differently.

## **Bitwarden**

Bitwarden is a SaaS or a self-hosted offering, which operates server-side and is accessible via a set of clients. All of the passwords that you save in your Vault at Bitwarden are hashed and salted, so even if an attacker gains access to the server(s) running the passwords databases, they would not be able to decrypt the passwords.

Bitwarden comes with a Web UI at https://vault.bitwarden.com and clients for a number of browsers, desktop apps, and mobile phone apps. It is secured with a single “master password” that also acts as the encryption and decryption key for the passwords of the user.

I must say that I was quite impressed with Bitwarden at first, as I had no prior experience with password managers other than the ones baked into your browser. Over time though, it subjectively felt kind of slow to use through the clients and I found the organization of the passwords not-so-great. Another major pitfall is that for every password by default, the detected URL worked off of the root domain, therefore autocompletion of passwords from a browser extension became non-functional too quickly when operating under one root domain.

For example; if I had `foo.example.com` and `bar.example.com` saved, Bitwarden would offer both for autocompletion. This got too frustrating too quickly.

I also increasingly felt the web interface at https://vault.bitwarden.com could become the main possible attack surface, as anyone who would had access to the server serving that website could change the source code to intercept the credentials per user. It is difficult for me to say how much more difficult two factor authentication makes this exploitable, but the point stands.

For simple personal use-cases; for non-technical family members I believe Bitwarden has a lot to offer. For me, though, it felt a little cumbersome. I decided to look for more.

## **Password Store**

password store (I will call it simply `pass` from here) has no similarities with Bitwarden except the use case of saving passwords.

First and foremost, pass in it’s original form is a command-line application (`pass`), with optional extensions such as `pass-otp` for handling 2FA temporary codes. There are GUI applications for multiple platforms available too, as well as applications for phones, all of which can be found [here](https://www.passwordstore.org/#other)

Pass uses PGP to encrypt the passwords themselves. PGP (compared to most passwords) has very strong security characteristics and is a proven and documented method of encryption for quite some time now.

For syncing, `pass` can be used in tandem with another standard program, the one and only, `git`. You can initialize your new password store (created with `pass init`) with `pass git init`, commit your created passwords with `pass git commit`, add a `git remote` and sync there and back with the classic `git push` and `git pull` commands, prepended with pass (`pass git push, pass git pull` etc.)

I enjoyed Pass quite a lot. It has some great strenghts, for example it is possible to use Pass in your scripts, programs, on the CLI and to manipulate the `stdout` as any other terminal command output.

Because of this, creating custom scripts and programs around Pass for even a simple use-case of manipulating your passwords even if you don’t like any of the current offerings.

One problem I've had with `pass` was that the (user-facing) complex nature of it sometimes interrupted my workflow, be it with not knowing the commands to do what I want to do, forgetting to specify -c on the CLI (leaking the entire password content to the terminal window in `stdout`), forgetting to `pass git push` on my home machine and then missing the passwords on my work laptop etc.

Things like these just happened without them being a direct problem of `pass` itself.

Even though pass encourages the git workflow, I have opted to using **Syncthing** to handle the synchronization instead to mitigate some of the times when I would forget to `pass git push` the changes made to the git server.

## **KeepassXC**

KeepassXC is primarily a desktop or mobile application which operates over a database file (with the `.kdbx` suffix) and saves all of it’s passwords there. It offers no built-in synchronization mechanism, but as the file is just a file on the filesystems, cloud syncing offerings (Nextcloud, Dropbox etc.) or tools such as Syncthing can be used to sync the password database around.

I personally have gone with **Syncthing** with KeepassXC, which allows for file synchronization between devices either over the LAN or over the internet through relay sevrers. As all of the syncrhonized content is encrypted and pressumably retained on my devices only, I prefer it over cloud sync.

The KeepassXC database can be secured via a password and optionally a key file (a file containing random generated content) or a hardware key (such as Yubikey or OnlyKey) for additional security.

To me, KeepassXC feels like a great middle-ground between the ease of use of Bitwarden and the strong encryption methodology of `pass`. It is enough for me to save my key file somewhere else other than the **Syncthing** sync system, distribute it by another method and sync the database with **Syncthing**. The passwords get synced around perfectly across all my devices, with strong security and a relatively easy recovery. I can just print the key file on paper and remember the master password, or on a CD, or a flash drive and put it into a physical safe or similar. Getting the DB on a new system is a breeze, I just need to add the device to my **Syncthing** chain, get the key file and I am good to go.

## **Summary**
Overall, I think all of the passwords managers mentioned are a great choice. They all offer fundamental improvements over just remembering a couple of passwords to use with ALL of one’s services (or reusing the same password for everything).

If you like having a password manager accessible as a service running in the cloud, Bitwarden is a solid choice. In case you would prefer having your passwords locally, but still easily shareable and accesible cross-platform, KeepassXC is a great, secure solution. In case you feel tech-savvy, or in need of an extensible and great CLI password manager, look no further than `pass`.
