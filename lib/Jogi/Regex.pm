#!/usr/bin/perl -w

use v6;

module Jogi::Regex{




  sub get_regex is export(){
    my $func = shift @_ || "syslog";
    return('.{15} \w+ (\w+)') if $func eq "syslog";
    return('.+? (\S+): ') if $func eq "vsftp";
    return('.{36} (\S+)') if $func eq "exim";
    return('.{15} (\S+)') if $func eq "tcpdump";
    return('(.+)') if $func eq "all";


  }
}

