#!/usr/bin/perl -w
#
#
# jogi
# Author: Kamil Kuaga<teodozjan@gmail.com>
# This software released under the terms of the Artistic License
# <http://www.opensource.org/licenses/artistic-license.html>

package Jogi::LogParser;
BEGIN {
    use Exporter;
    @ISA = qw(Exporter);
    @EXPORT = qw(parse_log);
}



sub  parse_log{

my($ip, %results, %count);

for(@_){

    chomp $_;
    next if /gconf/;
    next unless ($ip)=/(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/;
    s/://;
    s/\s{2,}/ /;
    s/\[\d+\]//;

    s/\"//g;
    s/\'//;
    s/port \d+//;

    $results{$ip}++;
    $count{$ip}{$_}++;
}
my ($i, $i2);
for $i (sort {$results{$b} <=> $results{$a}} keys %results){
    print " " , $results{$i}," > ", $i, "\n";
    for $i2 (keys %{$count{$i}}){
        print "\t", $count{$i}{$i2}, ">", $i2, "\n";
    }
    print "\n";
}
print "\n";
}
return 1;
END{}
