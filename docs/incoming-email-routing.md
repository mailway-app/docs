---
layout: default
title: Incoming Email Routing
nav_order: 2
permalink: /incoming-email-routing/
---

# Incoming Email Routing
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

Incoming Email Routing allows to match against incoming emails and apply rules to them.

<div style="text-align: center">
  <img src="/assets/images/incoming-email-routing.svg" alt="Incoming Email Routing diagram"/>
</div>

Commonly used to create email address aliases. For example, emails sent to `hello@example.com` could endup being received by `alice@example.fr`.


## Match against emails

If the email matches, the rule will be applied and the action will get executed.

### Catch-All
Matches all emails.

### Exact match
The email can be matched against a field, currently they are:
- *from*: from email address
- *to*: To email address

The field's value must be strictly equal to the value you provided in order to match.

### Pattern match
The email can be matched against a field, currently they are:
- *from*: from email address
- *to*: To email address

The provided value is a pattern, which allow to compare against one part of the field's value.
For instance `*@example.com` matches: `hi@example.com` or `john.doe@example.com`.

## Actions on emails

### Drop
The email will be reject with a permanent failure code. This is useful to block undesirable emails.

### Forward
The email will be fowarded to the provided email address(es).
