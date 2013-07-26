#!/usr/bin/perl -w


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
    say " " , $results{$i}," > ", $i;
    for $i2 (keys %{$count{$i}}){
        say "\t", $count{$i}{$i2}, ">", $i2;
    }
    say;
    
}
say;
}
return 1;
END{}
