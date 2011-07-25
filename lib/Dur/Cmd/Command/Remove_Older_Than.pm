package Dur::Cmd::Command::Remove_Older_Than;
use Moose;
use namespace::autoclean;
use feature 'say';

extends 'Dur::Cmd::Command';
with 'Dur::Cmd::Role::Execute' => { command => 'remove-older-than' },
     'Dur::Cmd::Role::Options::Forceable',
     'Dur::Cmd::Role::Arguments::URL';

sub inputs {
    my ($self, $args) = @_;
    return $args->[0];
}

__PACKAGE__->meta->make_immutable;
1;
__END__

=head1 NAME

Dur::Cmd::Command::Remove_Older_Than - Remove older backups
