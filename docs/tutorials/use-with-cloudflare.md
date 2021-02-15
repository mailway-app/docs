---
layout: page
title: How to use Mailway with Cloudflare
parent: Tutorials
permalink: /tutorials/use-mailway-with-cloudflare/
nav_order: 1
---

# How to use Mailway with Cloudflare
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

> This article shows how to configure your domain on Cloudflare to receive emails using Mailway.

## Before getting started

Login in your Mailway account to add the domain you want to receive emails on.

We will use `example.com` as an illustration, make sure to replace it with your domain.

## Configure DNS on Cloudflare

Login in your Cloudflare account and select your domain. On the DNS tab,

![](/assets/images/how-to-use-with-cloudflare/cloudflare1.jpg)


Click on the `Add record` button in DNS management:

- Select MX from the type drop-down menu
- Enter `@` to apply on the entire domain
- Enter the **mail server** you see in your Mailway account for the domain
- Leave **TTL** as **auto**
- Enter `10` for the **priority**
- Click on **save**

![](/assets/images/how-to-use-with-cloudflare/cloudflare2.jpg)

Repeat for the second mail server you see in your Mailway account for the domain.

Once you added the two MX records it should look like the following:

![](/assets/images/how-to-use-with-cloudflare/cloudflare3.jpg)

More information can be found on [Email undeliverable when using Cloudflare].

## Activating the domain

Go back to the Mailway [dashboard] and click on **verify the domain's DNS configuration**.

[dashboard]: https://dash.mailway.app
[Email undeliverable when using Cloudflare]: https://support.cloudflare.com/hc/en-us/articles/200168876-Email-undeliverable-when-using-Cloudflare
