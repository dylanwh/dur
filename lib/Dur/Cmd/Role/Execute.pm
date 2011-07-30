package Dur::Cmd::Role::Execute;
use MooseX::Role::Parameterized;
use namespace::autoclean;

parameter 'command' => (
    isa      => 'Str',
    required => 1,
);

requires 'arguments';

with 'Dur::Cmd::Role::ExportEnv';

role {
    my $p = shift;
    my $command = $p->command;

    method execute => sub {
        my ($self, $opt, $args) = @_;

        foreach my $loc ($self->manifest->locations) {
            system(
                $ENV{DUR_DEBUG} ? ( 'echo' ) : (),
                'duplicity',
                $command, 
                $self->arguments($loc, $args),
            ) and exit 1;
        }
    };

    method command_names => sub { return lc $command };

};

1;
