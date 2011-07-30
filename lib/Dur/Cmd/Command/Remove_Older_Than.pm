package Dur::Cmd::Command::Remove_Older_Than;
use Moose;
use namespace::autoclean;
use feature 'say';

extends 'Dur::Cmd::Command';
with
    'Dur::Cmd::Role::Execute'   => { command => 'remove-older-than' },
    'Dur::Cmd::Role::Arguments' => { spec    => [ 'user_args', 'options', 'remote_arg' ] },
    'Dur::Cmd::Role::Option::Force',
    'Dur::Cmd::Role::Option::Name';

sub user_args { return $_[2][0] }

__PACKAGE__->meta->make_immutable;
1;
__END__

=head1 NAME

Dur::Cmd::Command::Remove_Older_Than -  Delete all backup sets older than the given time.
