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

Mailway can operate in two modes:

### Connected mode

Connected mode is simpler to setup and allows to configure the routing rules using the Mailway [dashboard]:
```bash
$ mailway setup
```

#### Demo

<link rel="stylesheet" type="text/css" href="/assets/css/asciinema-player.css" />
<asciinema-player src="/assets/389538.cast" cols="318" rows="15"></asciinema-player>
<script src="/assets/js/asciinema-player.js"></script>

Once the setup is completed, the service will automatically start.

### Local mode

Local mode is a standalone email service and doesn't require communicating with Mailway online services:
```bash
$ mailway setup --local
```

See how to [Configure local routing rules].

## Installation with Docker

### Connected mode

```sh
docker run \
    -p 25:25 -p 80:80 -p 443:443 \
    -v /etc/mailway:/etc/mailway \
    -v /var/log/mailway:/var/log/journal \
    mailway/mailway
```

### Local mode

```sh
docker run \
    -p 25:25 \
    -v /etc/mailway:/etc/mailway \
    -v /var/log/mailway:/var/log/journal \
    -e MW_HOSTNAME=example.com \
    -e MW_EMAIL=youremail@example.com \
    mailway/mailway-local
```

Environment variables:
- `MW_HOSTNAME`: email server hostname (example: mx.example.com).
- `MW_EMAIL`: email used for TLS certificates.

[components]: /self-host/components/
[dashboard]: https://dash.mailway.app
[Configure local routing rules]: /self-host/configure-local-routing-rules/
