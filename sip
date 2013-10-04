#!/usr/bin/perl -wi.sip
use strict;
my $re		= shift;
my $proc	= eval "sub {\$_=shift; $re; return \$_; }" || die $@;
while(<>) {
  &$proc( $_ ); print;
}


=head1 SYNPOSIS

    > sip 's/this/that/g' *.txt

=head1 DESCRIPTION

This script performs an in-place substitution on every file.
Backup files will be created with the suffix ".sip" added to
the original filename.

SIP stands for Substitution In Place.

=head1 EXAMPLES

Change any occurence of "David" to "Suzie" in the file 'report.txt':

    > sip 's/David/Suzie/g' report.txt


=head1 NOTE

You are not limited to substitution - you could just as easily
use a translation (tr//) or insert any Perl code you want to
run on each line:

    > sip 'if( /Henry.*(\d+\.)/i ) { warn "Henry paid $1 dollars!\n"; }' paystubs.txt

=head1 AUTHOR

Desmond Lee, E<lt>deslee@shaw.caE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2003 by Desmond Lee

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut
