# ABSTRACT: Duplicity Frontend

package Dur::Cmd;
use Moose;
use namespace::autoclean;

extends qw(MooseX::App::Cmd);

__PACKAGE__->meta->make_immutable;
1;
