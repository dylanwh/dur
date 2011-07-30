package Dur::Cmd::Role::Option::FileToRestore;
use Moose::Role;
use namespace::autoclean;

has 'file_to_restore' => (
    traits => [ 'Array' ],
    is     => 'ro',
    isa    => 'ArrayRef[Str]',
    handles => { _files => 'elements' },
    default => sub      { [] },
);

requires 'options';

around 'options' => sub {
    my ($method, $self, $loc) = @_;

    my @options = map { ('--file-to-restore', $_) } $self->_files;
    return (
        @options,
        $self->$method($loc),
    );
};

1;
