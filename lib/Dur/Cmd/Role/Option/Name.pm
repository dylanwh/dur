package Dur::Cmd::Role::Option::Name;
use Moose::Role;
use namespace::autoclean;

requires 'options';

around 'options' => sub {
    my ($method, $self, $loc, $args) = @_;

    return ('--name' => $loc->name, $self->$method($loc));
};

1;
