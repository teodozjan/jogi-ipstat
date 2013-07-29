#!/usr/bin/perl -w

use v6;

package Ignorance;
use base 'Exporter';
our @EXPORT = qw(filter);

sub filter{
    shift;
    return 1 if /127.0.0.1/;
    return 0;

}
return 1;
END{}
