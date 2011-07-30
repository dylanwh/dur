package Dur::Cmd::Role::Arguments::Backup;
use Moose::Role;
use namespace::autoclean;

my @SPEC = ('manifest_options', 'location_options', 'options', 'local_arg', 'remote_arg');

with
    'Dur::Cmd::Role::Arguments' => { spec => \@SPEC },
    'Dur::Cmd::Role::Option::Name';

1;
