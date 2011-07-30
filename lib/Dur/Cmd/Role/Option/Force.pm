package Dur::Cmd::Role::Option::Force;
use Moose::Role;
use namespace::autoclean;

has 'force' => (
    traits      => ['Getopt'],
    is          => 'ro',
    isa         => 'Bool',
    default     => 0,
    cmd_aliases => 'f',
);

requires 'options';

around 'options' => sub {
    my $method = shift;
    my $self   = shift;
    my @rest   = $self->$method(@_);

    return ('--force', @rest) if $self->force;
    return (@rest);
};

1;
