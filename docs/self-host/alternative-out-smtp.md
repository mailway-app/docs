---
layout: page
title: Alternative out SMTP
parent: Self Host
permalink: /self-host/alt-out-smtp/
nav_order: 4
---

# Alternative out SMTP
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

Create a file: `/etc/mailway/conf.d/out-mailgun.yml`, with the content:
```yaml
out_smtp_host: smtp.eu.mailgun.org
out_smtp_username: postmaster@mailway.app
out_smtp_password: password
```

And then restart the service: `mailway restart`.
