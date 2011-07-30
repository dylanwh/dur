package Dur::Cmd::Role::Restore;
use Moose::Role;
use namespace::autoclean;

requires 'execute', 'run_hook';

with 'Dur::Cmd::Role::Arguments::Restore';

before 'execute' => sub {
    my $self = shift;
    $self->run_hook('pre_restore');
};

after 'execute' => sub {
    my $self = shift;
    $self->run_hook('post_restore');
};

1;
