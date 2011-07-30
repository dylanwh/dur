package Dur::Cmd::Role::Backup;
use Moose::Role;
use namespace::autoclean;

requires 'execute', 'run_hook';

with 'Dur::Cmd::Role::Arguments::Backup';

before 'execute' => sub {
    my $self = shift;
    $self->run_hook('pre_backup');
};

after 'execute' => sub {
    my $self = shift;
    $self->run_hook('post_backup');
};

1;
