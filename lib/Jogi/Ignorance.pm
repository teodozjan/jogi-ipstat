#!/usr/bin/perl -w

use v6;

module Jogi::Ignorance{

  sub filter is export() {
    shift(@_);
    return 1 if /127.0.0.1/;
    return 0;
  }
}
