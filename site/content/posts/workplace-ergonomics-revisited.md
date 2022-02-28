---
title: "Workplace ergonomics - Revisited"
date: 2022-02-28T20:12:21+02:00
draft: false
---

## Revisited

In the [first article](../workplace-ergonomics) of mine on ergonomics, I have written about some steps I have taken in the past to help me work at a computer more comfortably as a software (or rather, an infrastructure) engineer full-time.

We have gone through various topics, such as what table and chair that I am using, which mice I have tried and so on. Most of the gear that I have mentioned in that article I still do use, although I have added a few more pieces to my daily arsenal.

On the mouse front, one notable addition that I unfortunately didn't come to like as much is the **Elecom HUGE** trackball. The upward tilt wasn't too comfortable, and I didn't realize that for navigating my OS I actually do use the mouse shortcuts quite extensively when using the Logitech mice. I wouldn't say it's bad in general, it just didn't really fit me that well.

The changes in my keyboard lineup have been quite a big bigger, though.

## The boards of keys

A major thing that I have adopted since the last post are a couple of different **custom made, split keyboards**, most notably the [**Corne keyboard**](https://github.com/foostan/crkbd) and the [**Ferris Sweep**](https://github.com/davidphilipbarr/Sweep).

To get either of these, you have to either:

1. Source all the parts yourself and solder the keyboard together from the ground up
1. Buy a pre-built keyboard instead

I must say, that both of these keyboards are **excellent**. They provide minimalistic, ergonomic layouts, and thumb keys to help you access the lesser-used keys comfortably right where your fingers already are. Both of them are programmable, using the excellent [QMK](https://qmk.fm/) (or [ZMK](https://zmk.dev/), if you go wireless with a controller such as the [Nice!Nano](https://nicekeyboards.com/nice-nano)), making them ultra customizable for your exact needs.

**And most importantly, they provide a great deal of comfort over a standard keyboard (that is, once you get used to their layouts).**

### The **switch** (pun intended) from Corne to Sweep

There are essentially two reasons that made me move from the Corne to the Sweep:

1. The Sweep uses low-profile, mechanical switches, that can be **as light as 25g** (standard mechanical keyboards usually have switches that require anywhere from 50g to 75g of force). This combination is really pleasant to me, as it means that I don't have to work as hard to press the switches to type letters, and I don't have to raise my fingers above the table level as much, reducing the strain on my wrists and forearms that are, for me, the biggest impact area of pain.
1. I have adopted the [Miryoku layout]() even on my Corne keyboard. As this layout is usable even with 34 keys (although the creator of Miryoku strongly recommends 36 keys), I now had anywhere between 6 and 8 dead keys on my keyboard, doing nothing.

For reference, this is how the Miryoku layout looks like:

![miryoku](../static/images/miryoku.png)

It works on the principle of either tapping or holding a key to get either the "alpha" key code, or to access another layer with a different set of keycodes.

For example, to get the number `5` written on the screen, you can hold the middle-right thumb button and press `S`. If you look closely enough, you can see that the "standard" modifiers live on the home row. This means less weird hand movement around the modifiers in the traditional bottom left corner of the keyboard. As another example, to get `CTRL+Z`, you can hold `E` and press `Z`. To type capital `I`, you can hold `T` and press `I`.

As you can probably tell, the combination of potential layers is endless, and in those layers some keys don't have to just output a single characters; even entire sequences or combinations or characters are possible.

If you are wondering how you can use a 34 key keyboard with this layout, it's quite simple; the outer-most thumb keys are grouped into a double-press of the thumb keys on that side (for example, to hit `Escape`, I can just hit `Space` and `Tab`).

Daily, I am discovering new keyboards that I could adopt in the future. One of the hot contenders right now is the just-released [Cantor](https://github.com/diepala/cantor) keyboard, if it also had a 36 key layout available (right now it's available with 42 keys).

### What impact have these keyboards had on my hands?

I have already mentioned that they are quite a bit more comfortable, and that holds very true. After the initial period of learning the new keyboard layout and just using the Sweep daily, it has greatly increased the time I can spend in front of my computer daily, without experiencing pain.

Based on the excitement I had about building these custom keyboards, the help they have provided and the options available, **I have also decided to start an online shop called [**Qweebs**](https://qweebs.com/) with various ergonomic keyboards and keyboard parts**, with the aim to hopefully help other people manage their pain as well.

If you are interested in the shop and it's development, feel free to [join the growing Discord community](https://discord.com/invite/cmjMM9Ccq3) and let's talk there! A bridge to the Matrix network hopefully *coming soon™* as well.

### Other tools that I have adopted

One tool that I have adopted on the software side is an app called [Stretchly](https://hovancik.net/stretchly/), that reminds me to take breaks from the computer every half an hour, which reminds me to get up and walk around, which is quite good for you as I mentioned in the previous post.

I have also bought a **Rode Pod Mic microphone** with a stand to make way for potentially adopting [Talon](https://talonvoice.com) together with [Cursorless for VS Code](https://github.com/cursorless-dev/cursorless-vscode).

**Talon** provides a programmable layer between your voice and the OS, although the learning curve still seems a bit steep, and **Cursorless** is a framework for intelligent text manipulation, hands-free. **Think Vim, just for your voice**.

I highly recommend taking a look at each of those if speech-to-text sounds interesting. One recording that I would recommend would be the one by @2shea from the Strange Loop conference [here](https://www.youtube.com/watch?v=YKuRkGkf5HU).

**That's it for today, thanks for reading! If you have any questions, don't hesitate to contact me**
