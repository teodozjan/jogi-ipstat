#!/usr/bin/perl -w

use v6;

grammar Jogi::Regex{
    rule TOP {<stringed><ip><stringed>}
    rule stringed {.+}
    token byte {(\d**1..3) <?{ $0 < 256 }>}
    token ip {<byte> [\. <byte>] ** 3}
}


