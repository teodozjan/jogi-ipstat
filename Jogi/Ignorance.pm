#!/usr/bin/perl -w

package Ignorance;
BEGIN {
    use Exporter;
    @ISA = qw(Exporter);
    @EXPORT = qw(filter);
}

sub filter{
    shift;
    return 1 if /127.0.0.1/;
    return 0;

}
return 1;
END{}
