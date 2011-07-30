package Dur::Cmd::Role::jjjjj
use Moose::Role;
use namespace::autoclean;

requires 'locations';

has 'url_map' => (
    traits  => [ 'Hash', 'NoGetopt' ],
    is      => 'ro',
    isa     => 'HashRef[Str]',
    builder => '_build_url_map',
    lazy    => 1,
    handles => {
        urls  => 'values',
        url   => 'get',
    },
);

sub _build_url_map  { return +{ map { ($_, join('/', $_[0]->prefix, $_->name)) } $_[0]->locations } }

1;
