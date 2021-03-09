---
layout: page
title: Working around the ISP or Cloud provider port 25 block
parent: Guides
permalink: /guides/port-25-block-workaround/
---

# Working around the ISP or Cloud provider port 25 block
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

> This article shows how to configure Mailway to forward email to a SMTP server running on a custom port

[rfc6186] specifies the usage of SRV Records for locating the email server.

## Before getting started

Login in your Mailway account to add the domain you want to receive emails on.

We will use `example.com` as an illustration, make sure to replace it with your domain.

## Configure your DNS

![](/assets/images/srv/srv.jpg)

The SRV record should have the following configuration:
- name: `home.example.com`
- service: `_submission`
- protocol: `_tcp`
- target: where your email server is running
- port: the port your email server is running on

You can validate the change using [dig] and the following command:
```
$ dig SRV _submission._tcp.home.example.com +short
10 10 465 home.example.com.
```

Make sure that no MX records exists on `home.example.com` as they will take precedence.

## Configure Mailway

On your domain's rule on the Mailway [dashboard], forward all emails to `NAME@home.example.com` (the domain your configured the SRV record on).

All emails sent to `example.com` will now be sent to the SRV record target server.

[rfc6186]: https://tools.ietf.org/html/rfc6186
[dashboard]: https://dash.mailway.app
[dig]: https://en.wikipedia.org/wiki/Dig_(command)
