---
layout: page
title: Send emails from your domain using Gmail
parent: Guides
permalink: /guides/send-as-with-gmail/
nav_order: 5
---

# How to send emails from your domain using Gmail
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

> This article shows how to configure Gmail to send emails from your account configured on Mailway.

## Before getting started

Follow [Send emails from your domain (or `send as` feature)] to configure Mailway to send emails from your domain.

## Add the address on Gmail

Sign-in to your Gmail account, click the Settings gear at the upper right corner, click on `See all settings`. Then, select the `Accounts and Import` tab and, under the `Send mail as` section, click the link that says `Add another email address`.

A new window will pop up; enter your name and the email address from which you want to send out the emails:

![add the address on gmail](/assets/images/send/gmail-1.jpg)

Click on next step.

## Configure the SMTP server

Fill in the follwing informations:
- **SMTP server**: should be filled automatically. If not, enter one of your assigned MX record shown on the [Mailway dashboard].
- **Username**: the email address from which you want to send out the emails. Should have the format: `sven@example.com`.
- **Password**: the password displayed on the [Mailway dashboard].
- Select `secured connection using SSL`


Once filled, It should look like the following:
![configure the SMTP server](/assets/images/send/gmail-2.jpg)

Click on Add account.

## Confirmation

Gmail will email a verification code to your email address, to confirm enter the verification code or click on the link.

![confirmation](/assets/images/send/gmail-3.jpg)

Now your email address is able to send emails.

## Sending an email

When composing a new message, click on the `from` field's address and select the email address from which you want to send out the email:

![sending email](/assets/images/send/gmail-4.jpg)

[Mailway dashboard]: https://dash.mailway.app
[Send emails from your domain (or `send as` feature)]: /email-service/send-emails-from-your-domain/
