---
title: "About"
date: 2020-12-26T17:19:04+01:00
draft: false
ShowToC: false
TocOpen: false
hidemeta: true
---
Hi, I am Robin Opletal and on the internet I go by the name *fourstepper*.

At my day job, I work as a UNIX Systems and Network Administrator for a smaller IT company in Prague, Czech Republic.

I generally enjoy the use of automation and provisioning tools such as Ansible and have real world experience and knowledge of CI technologies, primarily GitLab CI. I also like working with containers, primarily because of their throwaway and simplistic nature.

Aside from that, I try to contribute to the open-source community where I can, be it with commits, bug reports, helping the users with the software or other activities.

If you are interested to find out how this website is built, feel free to check out the sources [here](https://git.sr.ht/~fourstepper/robinopletal.com). The site is basically bundled into a Docker file in CI and pushed to the repo, from where I pull it on the host server and run it behind a traefik proxy, which handles SSL termination for me. I still need to automate the deployment itself, so that every push automatically re-pulls the image and restarts the container with the fresh content.

If you have any questions regarding the blog, my work or anything at all, feel free to reach out to me via email at: me at robinopletal dot com
