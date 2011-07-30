package Dur::Cmd::Role::Execute;
use MooseX::Role::Parameterized;
use namespace::autoclean;

parameter 'command' => (
    isa      => 'Str',
    required => 1,
);

requires 'arguments', 'run_hook';

role {
    my $p = shift;
    my $command = $p->command;

    method execute => sub {
        my ($self, $opt, $args) = @_;

        foreach my $loc ($self->manifest->locations) {
            $self->run_hook('pre_cmd', $command, $loc->name);
            system(
                $ENV{DUR_DEBUG} ? ( 'echo' ) : (),
                'duplicity',
                $command, 
                $self->arguments($loc, $args),
            ) and exit 1;
            $self->run_hook('post_cmd', $command, $loc->name);
        }
    };

    method command_names => sub { return lc $command };

};

1;
