package Dur::Cmd::Role::ExportEnv;
use Moose::Role;
use namespace::autoclean;

requires 'env';

before 'execute' => sub {
    my $self = shift;

    $self->env->export_all;
};



1;
