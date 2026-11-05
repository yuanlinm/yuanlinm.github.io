---
title: "{{ .File.ContentBaseName | replaceRE `^\d{4}-\d{2}-\d{2}-` "" | humanize }}"
date: {{ time.In "Asia/Shanghai" now | time.Format "2006-01-02T15:04:05-07:00" }}
slug: "{{ .File.ContentBaseName | replaceRE `^\d{4}-\d{2}-\d{2}-` "" }}"
tags: []
draft: true   # set to false to publish
---

