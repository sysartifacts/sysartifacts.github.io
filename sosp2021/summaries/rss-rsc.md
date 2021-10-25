---
layout: single
title: "Artifact Review Summary: Regular Sequential Serializability and Regular Sequential Consistency"
sidebar:
    title: 'SOSP 2021'
    nav: sosp2021toc
---

{% include_relative _result-header.html %}

## Description of the Artifact

The artifact consists of the two GitHub links to the systems that demonstrate *Regular Sequential Serializability* and *Regular Sequential Consistency*:

1. *Spanner-RSS*, a modified version of Spanner implemented in the TAPIR framework.
[Link](https://github.com/jmhelt/tapir/tree/spanner) (branch: "spanner")
commit hash: *7bdc7027aa90470295a9f01ce685b6247e5aad98*

2. *Gryff-RSC*, a Gryff replicated storage system with added Regular Sequential Consistency.
[Link](https://github.com/princeton-sns/gryff-rs/tree/rs) (branch: "rs")
commit hash: *0db4e7fa5125022963aceb61c4c8ebed6a50d59a*

## How The Artifact Supports The Paper

Both Spanner-RSS and Gryff-RSC are built on-top of existing code bases. Specifically, Spanner implementation within the TAPIR framework and Gryff, respectively. And while not explicity stated, implementation of the of RSS and RSC can be found by going over the commit history of the respective GitHub repositories:

- Major component of the Spanner-RSS: [Link](https://github.com/jmhelt/tapir/blob/spanner/src/store/strongstore/transactionstore.cc)

- Gryff-RSC: [Link](https://github.com/princeton-sns/gryff/commit/540f110dccddfe9f2d268a36ca674b286d6a3f27)
