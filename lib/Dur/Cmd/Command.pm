package Dur::Cmd::Command;
use Moose;
use namespace::autoclean;

use MooseX::YAML qw(LoadFile -xs);
use MooseX::Types::Path::Class 'File';

extends 'MooseX::App::Cmd::Command';
with 'MooseX::Getopt::Dashes';

has 'prefix' => (
    traits        => ['Getopt'],
    is            => 'ro',
    isa           => 'Str',
    required      => 1,
    cmd_aliases   => 'p',
    documentation => "URI prefix for targets",
);

has 'env_file' => (
    traits        => ['Getopt'],
    is            => 'ro',
    isa           => File,
    coerce        => 1,
    required      => 1,
    cmd_aliases   => 'e',
    documentation => "YAML file specify environmental variables",
);

has 'manifest_file' => (
    traits        => ['Getopt'],
    is            => 'ro',
    isa           => File,
    coerce        => 1,
    required      => 1,
    cmd_aliases   => 'm',
    documentation => "YAML file describing what to back up",
);

has 'manifest' => (
    traits  => ['NoGetopt'],
    is      => 'ro',
    isa     => 'Dur::Manifest',
    lazy    => 1,
    builder => '_build_manifest',
);

has 'env' => (
    traits  => ['NoGetopt'],
    is      => 'ro',
    isa     => 'Dur::Env',
    lazy    => 1,
    builder => '_build_env',
);

sub _build_manifest {
    my ($self) = @_;
    my $manifest = LoadFile($self->manifest_file);

    return $manifest->clone(
        locations => [
            map {
                $_->clone( url => sprintf "%s/%s", $self->prefix, $_->name )
            } $manifest->locations
        ],
    );
}


sub _build_env { LoadFile(shift->env_file) }

__PACKAGE__->meta->make_immutable;
1;

__END__

=head1 NAME

Dur::Cmd::Command - blaa
