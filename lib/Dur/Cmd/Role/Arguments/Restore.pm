package Dur::Cmd::Role::Arguments::Restore;
use Moose::Role;
use namespace::autoclean;

my @SPEC = ('manifest_options', 'options', 'remote_arg', 'local_arg');

with
    'Dur::Cmd::Role::Arguments' => { spec => \@SPEC },
    'Dur::Cmd::Role::Option::Name',
    'Dur::Cmd::Role::Option::FileToRestore',
    'Dur::Cmd::Role::Option::Force';

1;

1;
