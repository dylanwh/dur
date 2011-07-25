package Dur::Cmd::Role::Arguments::Pull;
use Moose::Role;
use namespace::autoclean;

requires 'options';

sub arguments {
    my ($self, $loc, $args) = @_;

    return ( $self->options($loc), $loc->url, $loc->path);
}

1;
