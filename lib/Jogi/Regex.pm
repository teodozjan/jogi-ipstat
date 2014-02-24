#!/usr/bin/perl -w

use v6;

grammar Jogi::Ip{
    regex TOP{^<logrecord>+$}
    #rule byte {(<digit>**1..3) <?{ $0 < 256 }>}
    #rule ip {<byte> [\. <byte>] ** 3}
    regex stamp{<alpha>**3 <space> <digit>**2 <space> <digit>**2 ':' <digit>**2 ':' <digit>**2 }
    regex hostname{<-space>+}
    regex service{<-space>+ <?before ':'>}
    regex message{\N+<?before \n>}
    regex logrecord {<stamp> <space> <hostname> <space>	 <service> <message> <space>}
 
   
}

class Jogi::SysLogRecord{
    my $stamp;
    my $service;
    my $ip;
}

class Jogi::IpActions{
    my $counter = 0;
    my Int constant $PACK_SIZE = 100;

    method TOP($/){
	say "\nParsing end";
    }

    method logrecord($/){
	if ++$counter % $PACK_SIZE == 0
	{
	    $counter = 0;
	    print ".";
	}
    }   

    method stamp($/){
	# say "stamp $/|"; stamp seems to always hit ok
    } 

    method message($/){
	#say "message $/";
    }

    method hostname($/){
	#say "hostname $/";
    }

    method service($/){
	#say "service $/";
    }
}



