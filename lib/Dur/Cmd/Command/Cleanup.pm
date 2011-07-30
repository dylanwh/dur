package Dur::Cmd::Command::Cleanup;
use Moose;
use namespace::autoclean;
use feature 'say';

extends 'Dur::Cmd::Command';
with
    'Dur::Cmd::Role::Execute'   => { command => 'cleanup' },
    'Dur::Cmd::Role::Arguments' => { spec    => [ 'options', 'remote_arg' ] },
    'Dur::Cmd::Role::Option::Force',
    'Dur::Cmd::Role::Option::Name';

__PACKAGE__->meta->make_immutable;
1;
__END__

=head1 NAME

Dur::Cmd::Command::Cleanup - Delete the extraneous duplicity files on the given backend.
