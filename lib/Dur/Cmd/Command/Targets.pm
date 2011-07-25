package Dur::Cmd::Command::Targets;
use Moose;
use namespace::autoclean;
use feature 'say';

extends 'Dur::Cmd::Command';

sub execute {
    my $self = shift;
}

__PACKAGE__->meta->make_immutable;
1;
__END__

=head1 NAME

Dur::Cmd::Command::Targets - List available duplicity targets
