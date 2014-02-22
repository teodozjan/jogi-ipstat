#!/usr/bin/perl -w

use v6;

grammar Jogi::Regex;

#rule TOP {<stringed><ip><stringed>}
rule stringed {.+}
rule byte {(\d**1..3) <?{ $0 < 256 }>}
rule ip {<byte> [\. <byte>] ** 3}



