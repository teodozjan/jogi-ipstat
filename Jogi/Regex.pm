#!/usr/bin/perl -w


package Jogi::Regex;
BEGIN {
    use Exporter;
    @ISA = qw(Exporter);
    @EXPORT = qw(&get_regex);

}

sub get_regex{
    my $func = shift @_ || "syslog";
    return('.{15} \w+ (\w+)') if $func eq "syslog";
    return('.+? (\S+): ') if $func eq "vsftp";
    return('.{36} (\S+)') if $func eq "exim";
    return('.{15} (\S+)') if $func eq "tcpdump";
    return('(.+)') if $func eq "all";


}
return 1;
END{}
