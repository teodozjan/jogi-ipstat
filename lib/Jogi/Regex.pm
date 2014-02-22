#!/usr/bin/perl -w

use v6;

grammar Jogi::Ip{
    token TOP{^<logrecord>+$}

    #token byte {(\d**1..3) <?{ $0 < 256 }>}
    #token ip {<byte> [\. <byte>] ** 3}
    token stamp{<alpha>**3 \s \d**2 \s \d**2 ':' \d**2 ':' \d**2 }
    token hostname{\w+}
    token service{\w+}
    token message{\w+}
    token logrecord {<stamp>\s<hostname>\s+<service>':'\s <message>}


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



