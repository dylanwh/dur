package Dur::Cmd::Command::Restore;
use Moose;
use namespace::autoclean;
use feature 'say';

extends 'Dur::Cmd::Command';
with 'Dur::Cmd::Role::Execute' => { command => 'restore' },
     'Dur::Cmd::Role::Arguments::Restore';

__PACKAGE__->meta->make_immutable;
1;
__END__

=head1 NAME

Dur::Cmd::Command::Full - Do full backup

__PACKAGE__->meta->make_immutable;
1;
