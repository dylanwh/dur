package Dur::Cmd::Command;
use Moose;
use namespace::autoclean;

use MooseX::YAML qw(LoadFile -xs);
use MooseX::Types::Moose ':all';
use MooseX::Types::Path::Class 'File';

extends 'MooseX::App::Cmd::Command';
with 'MooseX::Getopt::Dashes', 'MooseX::LogDispatch::Levels';

has 'backend' => (
    traits        => ['Getopt'],
    is            => 'ro',
    isa           => Str,
    required      => 1,
    cmd_aliases   => 'b',
    documentation => "Duplicity backend, in the form of a URI prefix",
);

has 'log_dispatch_conf' => (
    traits  => ['NoGetopt'],
    is      => 'ro',
    isa     => 'HashRef',
    default => sub {
        +{  
            class     => 'Log::Dispatch::Screen',
            min_level => 'debug',
            stderr    => 1,
            format    => '[%p] %m%n',
        };
    },
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
    handles => [qw[ names locations run_hook ]],
);

has 'env' => (
    traits  => ['NoGetopt'],
    is      => 'ro',
    isa     => 'Dur::Env',
    lazy    => 1,
    builder => '_build_env',
);

sub _build_manifest { return LoadFile($_[0]->manifest_file) }
sub _build_env      { return LoadFile($_[0]->env_file)      }

sub BUILD {
    $_[0]->env->export_all;
}

__PACKAGE__->meta->make_immutable;
1;

__END__

=head1 NAME

Dur::Cmd::Command - blaa
