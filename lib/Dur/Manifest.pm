package Dur::Manifest;
use Moose;
use namespace::autoclean;

use MooseX::Types::Moose 'Str', 'ArrayRef';
use Dur::Types 'ArrayOfLocations';
use Dur::Location;

with 'MooseX::Clone';

has [ 'pre_run', 'post_run' ] => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

has 'locations' => (
    traits   => ['Array'],
    reader   => '_locations',
    isa      => ArrayOfLocations,
    required => 1,
    coerce   => 1,
    handles  => { locations => 'elements' },
);

__PACKAGE__->meta->make_immutable;
1;
