package Dur::Option;
use Moose;
use namespace::autoclean;

use MooseX::Types::Moose ':all';
use Dur::Types 'OptionTuple';

has 'value' => (
    traits   => ['Array'],
    is       => 'ro',
    isa      => OptionTuple,
    required => 1,
    coerce   => 1,
    handles  => { args => 'elements' },
);

__PACKAGE__->meta->make_immutable;

1;
