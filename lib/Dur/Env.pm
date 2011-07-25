package Dur::Env;
use Moose;
use namespace::autoclean;

has 'exports' => (
    traits   => ['Hash'],
    is       => 'ro',
    isa      => 'HashRef[Str]',
    required => 1,
    handles  => { get => 'get', keys => 'keys' },
);

sub export_all {
    my ($self) = @_;

    $self->export($_) foreach $self->keys;
}

sub export {
    my ($self, $key) = @_;

    $ENV{ $key } = $self->get($key);
}

__PACKAGE__->meta->make_immutable;
1;
