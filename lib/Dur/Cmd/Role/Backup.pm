package Dur::Cmd::Role::Backup;
use Moose::Role;
use namespace::autoclean;

my @SPEC = ('manifest_options', 'location_options', 'options', 'local_arg', 'remote_arg');

with
    'Dur::Cmd::Role::Arguments' => { spec => \@SPEC },
    'Dur::Cmd::Role::Option::Name';

requires 'execute', 'run_hook';

before 'execute' => sub {
    my $self = shift;
    $self->run_hook('pre_backup');
};

after 'execute' => sub {
    my $self = shift;
    $self->run_hook('post_backup');
};

1;
