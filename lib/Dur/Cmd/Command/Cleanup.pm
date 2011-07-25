package Dur::Cmd::Command::Cleanup;
use Moose;
use namespace::autoclean;
use feature 'say';

extends 'Dur::Cmd::Command';
with 'Dur::Cmd::Role::Execute' => { command => 'cleanup' },
     'Dur::Cmd::Role::Arguments::URL',
     'Dur::Cmd::Role::Options::Forceable';

__PACKAGE__->meta->make_immutable;
1;
__END__

=head1 NAME

Dur::Cmd::Command::Targets - List available duplicity targets
