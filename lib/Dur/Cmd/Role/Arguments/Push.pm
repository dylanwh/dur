package Dur::Cmd::Role::Arguments::Push;
use Moose::Role;
use namespace::autoclean;

requires 'options';

sub arguments {
    my ($self, $loc, $args) = @_;

    return ( $self->options($loc), $loc->path, $loc->url );
}

1;
