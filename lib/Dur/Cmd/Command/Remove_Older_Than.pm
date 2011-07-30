package Dur::Cmd::Command::Remove_Older_Than;
use Moose;
use namespace::autoclean;
use feature 'say';

extends 'Dur::Cmd::Command';
with 'Dur::Cmd::Role::Execute' => { command => 'remove-older-than' },
     'Dur::Cmd::Role::Options',
     'Dur::Cmd::Role::Option::Force',
     'Dur::Cmd::Role::Option::Name';

sub arguments {
    my ($self, $loc, $args) = @_;

    return ($args->[0], $self->options($loc), $self->url($loc));
}

__PACKAGE__->meta->make_immutable;
1;
__END__

=head1 NAME

Dur::Cmd::Command::Remove_Older_Than - Remove older backups
