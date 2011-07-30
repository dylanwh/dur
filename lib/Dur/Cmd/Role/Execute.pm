package Dur::Cmd::Role::Execute;
use MooseX::Role::Parameterized;
use namespace::autoclean;

parameter 'command' => (
    isa      => 'Maybe[Str]',
    required => 1,
);

requires 'arguments';

role {
    my $p = shift;
    my $command = $p->command;

    method execute => sub {
        my ($self, $opt, $args) = @_;

        foreach my $loc ($self->locations) {
            $self->info("Working on " . $loc->name);
            system(
                $ENV{DUR_DEBUG} ? ( 'echo' ) : (),
                'duplicity',
                defined($command) ? ( $command ) : (),
                $self->arguments($loc, $args),
            ) and exit 1;
        }
    };

    if (defined $command) {
        method command_names => sub { return lc $command };
    }
};

1;
