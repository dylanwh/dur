package Dur::Cmd::Command::Verify;
use Moose;
use namespace::autoclean;
use feature 'say';

extends 'Dur::Cmd::Command';
with 'Dur::Cmd::Role::Execute' => { command => 'verify' },
     'Dur::Cmd::Role::Arguments::Restore';

__PACKAGE__->meta->make_immutable;
1;
__END__

=head1 NAME

Dur::Cmd::Command::Verify - Verify a backup
