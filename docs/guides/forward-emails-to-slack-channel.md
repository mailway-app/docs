---
layout: page
title: Forward emails to a Slack channel
parent: Guides
permalink: /guides/forward-emails-to-slack-channel/
nav_order: 2
---

# Forward emails to a Slack channel
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

> This article shows how to configure Slack to show emails in a channel with Mailway

## Configure the Slack channel

On your Slack instance you can either: create a new channel or use an existing one.

## New channel

Create a new channel and click on **Forward email to this channel**.

![New empty channel](/assets/images/slack/new-channel.jpg)

A generated email address will be shown, click on **Copy**.

## Existing channel

Click on the information icon, then click on **more** and **send emails to channel**.

A generated email address will be shown, click on **Copy**.

## Configure Mailway

Go back to the Mailway [dashboard] and go to your domain's rules.

Create a new rule that forwards to the generated Slack email address:
![new rule to forward to Slack's email address](/assets/images/slack/rule.jpg)

To finish, click on **Add rule**. Now all emails sent to `events@example.com` will be shown in the Slack channel.

![Mail example shown in the Slack channel](/assets/images/slack/example.jpg)

More information can be found on [Send emails to Slack].

[Send emails to Slack]: https://slack.com/intl/en-gb/help/articles/206819278-Send-emails-to-Slack
[dashboard]: https://dash.mailway.app
