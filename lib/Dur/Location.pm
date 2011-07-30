package Dur::Location;
use Moose;
use namespace::autoclean;

use MooseX::Types::Moose 'ArrayRef', 'Str';
use MooseX::Types::Path::Class 'Dir';

with 'Dur::Role::Options';

has 'name' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

has 'path' => (
    is       => 'ro',
    isa      => Dir,
    coerce   => 1,
    required => 1,
);

__PACKAGE__->meta->make_immutable;

1;
