package Dur::Cmd::Command::Incremental;
use Moose;
use namespace::autoclean;
use feature 'say';

extends 'Dur::Cmd::Command';

with
    'Dur::Cmd::Role::Execute' => { command => 'incremental' },
    'Dur::Cmd::Role::Arguments::Push',
    'Dur::Cmd::Role::Options::Forceable',
    'Dur::Cmd::Role::Options::PerLocation';

__PACKAGE__->meta->make_immutable;
1;
__END__

=head1 NAME

Dur::Cmd::Command::Incremental - Do incremental backup

__PACKAGE__->meta->make_immutable;
1;
