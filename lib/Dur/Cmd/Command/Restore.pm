package Dur::Cmd::Command::Restore;
use Moose;
use namespace::autoclean;
use feature 'say';

extends 'Dur::Cmd::Command';
with
    'Dur::Cmd::Role::Execute'   => { command => 'restore' },
    'Dur::Cmd::Role::Arguments' => { spec => [qw[ manifest_options options remote_arg local_arg ]] },
    'Dur::Cmd::Role::Option::Name',
    'Dur::Cmd::Role::Option::FileToRestore',
    'Dur::Cmd::Role::Option::Force';

before 'execute' => sub {
    my ($self) = @_;
    $self->run_hook('pre_restore');
};

after 'execute' => sub {
    my ($self) = @_;
    $self->run_hook('post_restore');
};

__PACKAGE__->meta->make_immutable;
1;
__END__

=head1 NAME

Dur::Cmd::Command::Restore - Restore files from backup
