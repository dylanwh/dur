package Dur::Cmd::Role::Options::Forceable;
use Moose::Role;
use namespace::autoclean;

with 'Dur::Cmd::Role::Options';

has 'force' => (
    traits      => ['Getopt'],
    is          => 'ro',
    isa         => 'Bool',
    default     => 0,
    cmd_aliases => 'f',
);

around 'options' => sub {
    my $method = shift;
    my $self   = shift;
    my @rest   = $self->$method(@_);

    return ('--force', @rest) if $self->force;
    return (@rest);
};

1;
