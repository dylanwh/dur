package Dur::Cmd::Role::Options::PerLocation;
use Moose::Role;
use namespace::autoclean;

with 'Dur::Cmd::Role::Options';

around 'options' => sub {
    my ($method, $self, $loc, $args) = @_;
    
    return ($loc->options, $self->method($loc, $args));
};

1;
