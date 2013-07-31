#!/usr/bin/perl -w

use v6;
module Jogi::LogParser{


  sub  parse_log is export(){

    my $ip;
    my  %results;
    my %count;
  

    for (@_) {

      chomp $_;
      next if /gconf/;
      next unless ($ip)=/(\d{1..3}\.\d{1..3}\.\d{1..3}\.\d{1..3})/;
      s/\://;
      s/\s{2..*}/ /;
      s/\[\d+\]//;

      s:g/\"//;
      s/\'//;
      s/port \d+//;

      %results{$ip}++;
      %count{$ip}{$_}++;
    }
my $i;my $i2;
    for (%results.keys.sort:{%results{$^b} <=> %results{$^a}}) -> $i {
      #say " " , %results{$i}," > ", $i;
      #for (keys %{%count{$i}}) -> $i2 {
#	say "\t", %count{$i}{$i2}, ">", $i2;
 #     }
say $i;
      say;
    
    }
    say;
  }

}

      
