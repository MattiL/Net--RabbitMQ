require 5.004 ;
use ExtUtils::MakeMaker 5.16 ;
use Config ;

my @parts = qw/api connection debug framing mem socket table/;
my $cfiles = [ "socket.c", map { "amqp_$_.c" } @parts ];
my $ofiles = join ' ', ( 'socket.o', map { "amqp_$_.o" } @parts );

WriteMakefile(
        NAME            => 'Net::RabbitMQ',
        VERSION_FROM    => 'RabbitMQ.pm',
	OBJECT          => "RabbitMQ.o $ofiles",
	C		=> $cfiles,
        H               => ['socket.h'],
	OPTIMIZE	=> $ENV{'OPTIMIZE'}
        );

