package Dur::Cmd::Role::Arguments;
use MooseX::Role::Parameterized;
use namespace::autoclean;

parameter 'spec' => (
    isa      => 'ArrayRef[Str]',
    required => 1,
);

role {
    my $p = shift;
    my @methods = @{ $p->spec };

    requires 'backend', 'manifest', @methods;

    method 'arguments' => sub {
        my ($self, $loc, $args) = @_;

        return map { $self->$_($loc, $args) } @methods;
    };

    method manifest_options => sub {
        my ($self) = @_;
        $self->manifest->options;
    };

    method location_options => sub {
        my ($self, $loc, $args) = @_;
        return $loc->options;
    };

    method options => sub { 
        my ($self, $loc, $args) = @_;
        return ();
    };

    method local_arg => sub {
        my ($self, $loc, $args) = @_;

        return $loc->path;
    };

    method remote_arg => sub {
        my ( $self, $loc, $args ) = @_;

        return $self->backend . '/' . $loc->name;
    };
};

1;
