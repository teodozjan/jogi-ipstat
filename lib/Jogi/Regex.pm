#!/usr/bin/perl -w

use v6;

grammar Jogi::Ip{
    token TOP{<logrecord>+}
    #rule byte {(<digit>**1..3) <?{ $0 < 256 }>}
    #rule ip {<byte> [\. <byte>] ** 3}
    token stamp{<alpha>**3 <space> <digit>**2 <space> <digit>**2 ':' <digit>**2 ':' <digit>**2 }
    token hostname{<-space>+}
    token service{<-space>+}
    token message{.+?\n+}#<-space>+}
    token logrecord {^^<stamp><space><hostname><space><service>:<message>}
 
   
}

class Jogi::SysLogRecord{
    my $stamp;
    my $service;
    my $ip;

}

class Jogi::IpActions{
    method TOP($/){
	say "PTOP $/";
    }

    method logrecord($/){
	say "logrecord $/ |";
    }   

    method stamp($/){
	say "stamp $/|";
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



