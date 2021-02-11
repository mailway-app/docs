---
layout: page
title: Getting Started
parent: Self Host
permalink: /self-host/getting-started/
nav_order: 1
---

# Getting Started
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Supported platform

Currently only Ubuntu 20.04 with systemd is officially supported.

## Installation

### Add the Debian repository

Add the repository:
```bash
$ curl -s https://apt.mailway.app/ubuntu/KEY.gpg | sudo apt-key add -
$ sudo curl -s -o /etc/apt/sources.list.d/mailway.list https://apt.mailway.app/ubuntu/mailway.list
$ sudo apt update
```

## Install Mailway

```bash
$ sudo apt install mailway
```

This will install Mailway and all its [components].

## Setup

```bash
$ mailway setup
```

### Demo

<link rel="stylesheet" type="text/css" href="/assets/css/asciinema-player.css" />
<asciinema-player src="/assets/389538.cast" cols="318" rows="15"></asciinema-player>
<script src="/assets/js/asciinema-player.js"></script>

Once the setup is completed, the service will automatically start.

## Installation with Docker

```sh
docker run \
    -p 25:25 -p 80:80 -p 443:443 \
    -v /etc/mailway:/etc/mailway \
    mailway/mailway
```

It will run the Mailway setup automatically and persistent the configuration in `/etc/mailway` on the host.

[components]: /self-host/components/
