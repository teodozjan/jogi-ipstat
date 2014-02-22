#!/usr/bin/perl -w

use v6;

grammar Jogi::Ip{
    regex TOP{^<logrecord>+$}

    #regex byte {(\d**1..3) <?{ $0 < 256 }>}
    #regex ip {<byte> [\. <byte>] ** 3}
    regex stamp{<alpha>**3 \s \d**2 \s \d**2 ':' \d**2 ':' \d**2 }
    regex hostname{\w+}
    regex service{\w+}
    regex message{\w+}
    regex logrecord {<stamp>\s<hostname>\s+<service>':'\s <message>}


}

class Jogi::SysLogRecord{
    my $stamp;
    my $service;
    my $ip;

}

class Jogi::IpActions{
    method TOP($/){
	say "TOP $/";
    }

    method logrecord($/){
	say "logrecord $/";
    }   

    method stamp($/){
	say "stamp $/";
    } 

    method message($/){
	say "message $/";
    }

    method hostname($/){
	say "hostname $/";
    }

    method service($/){
	say "service $/";
    }
}



