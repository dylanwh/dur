package Dur::Cmd::Command::Backup;
use Moose;
use namespace::autoclean;
use feature 'say';

extends 'Dur::Cmd::Command';
with 'Dur::Cmd::Role::Execute' => { command => undef },
     'Dur::Cmd::Role::Backup';

__PACKAGE__->meta->make_immutable;
1;
__END__

=head1 NAME

Dur::Cmd::Command::Backup - Perform either full or incremental backup

__PACKAGE__->meta->make_immutable;
1;

__PACKAGE__->meta->make_immutable;
1;
