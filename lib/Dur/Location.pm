package Dur::Location;
use Moose;
use namespace::autoclean;

use MooseX::Types::Moose 'ArrayRef', 'Str';
use MooseX::Types::Path::Class 'Dir';

use Dur::Types 'ArrayOfOptions';
use Dur::Option;

with 'MooseX::Clone';

has 'name' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

has 'url' => (
    is        => 'ro',
    isa       => Str,
    predicate => 'has_url',
);

has 'path' => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

has 'options' => (
    traits  => ['Array' ],
    reader  => '_options',
    isa     => ArrayOfOptions,
    default => sub { [] },
    coerce  => 1,
    handles => { options => [ 'map', sub { $_->args } ], },
);

__PACKAGE__->meta->make_immutable;

1;
