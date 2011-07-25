package Dur::Cmd::Role::Arguments::URL;
use Moose::Role;
use namespace::autoclean;

requires 'options';

sub inputs { }

sub arguments {
    my ($self, $loc, $args) = @_;

    return ( $self->inputs($args), $self->options($loc), $loc->url );
}

1;
