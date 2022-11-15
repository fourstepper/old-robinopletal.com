---
title: "Safe rm -rf *"
date: 2022-03-16T20:12:21+02:00
draft: false
tags: ["tips", "software", "cli"]
---

Every once in a while, you have to delete all files and folders recursively.

Maybe you are doing this to clean up and you put a lot of time and thought to each command. Maybe you just need a quick clean up of your starting project to start over while learning.

But maybe you are traversing directories back and forth, and need to wipe a lot of them at the same time, **quickly**.

Turns out, doing that you have quite a chance to just wipe something you didn't want to wipe. The process of restoring a backup awaits :)

Or! you instead learn this method that I have adopted while cleaning directories.

## Method

Let's say we have a directory structure that looks like this: `/foo/bar`. We want to delete all files in the `bar` sub-directory.

If you would go the standard route, you would just `cd /foo/bar` and quickly whip out `rm -rf *`.

I would advise you to instead:

```
cd /foo/bar
rm -rf ../bar/*
```
or
```
cd foo
rm -rf bar/*
```

## Why?

There are a few reasons:

1. You are less likely to mistype the command out of muscle memory in a directory in which it's not wanted
1. You are less likely to wreck havoc on your directories accidentaly when getting back to this command in the shell's history

At first, this might feel awkward to do, but you will thank yourself later.
