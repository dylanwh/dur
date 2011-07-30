package Dur::Role::Options;
use Moose::Role;
use namespace::autoclean;

use Dur::Types 'ArrayOfOptions';
use Dur::Option;

has 'options' => (
    traits  => ['Array' ],
    reader  => '_options',
    isa     => ArrayOfOptions,
    default => sub { [] },
    coerce  => 1,
    handles => { options => [ 'map', sub { $_->args } ], },
);

1;
