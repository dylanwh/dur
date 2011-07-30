package Dur::Manifest;
use Moose;
use namespace::autoclean;

use File::pushd 'tempd';
use Path::Class 'file';

use MooseX::Types::Moose 'Str', 'ArrayRef';

use Dur::Types 'ArrayOfLocations';
use Dur::Location;

with 'Dur::Role::Options';

has 'hooks' => (
    traits  => ['Hash'],
    is      => 'ro',
    isa     => 'HashRef[Str]',
    default => sub { +{} },
    handles => {
        get_hook => 'get',
        has_hook => 'exists',
    },
);

has 'locations' => (
    traits   => ['Array'],
    reader   => '_locations',
    isa      => ArrayOfLocations,
    required => 1,
    coerce   => 1,
    handles  => { locations => 'elements', names => ['map', sub { $_->name }] },
);

sub run_hook {
    my ($self, $name, @args) = @_;
    if ($self->has_hook($name)) {
        my $dir = tempd();
        my $hook = file($dir, "dur.$name");
        $hook->openw->print( $self->get_hook($name) );
        chmod 0500, $hook;
        return system($hook, @args) == 0;
    }
}

__PACKAGE__->meta->make_immutable;
1;
