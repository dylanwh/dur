package Dur::Cmd::Role::Execute;
use MooseX::Role::Parameterized;
use namespace::autoclean;

parameter 'command' => (
    isa      => 'Str',
    required => 1,
);


role {
    my $p = shift;
    my $command = $p->command;

    with 'Dur::Cmd::Role::ExportEnv';

    method "execute" => sub {
        my ($self, $opt, $args) = @_;

        foreach my $loc ($self->manifest->locations) {
            system('echo',
                'duplicity',
                $command, 
                $self->arguments($loc, $args),
            ) and exit 1;
        }
    };

    method "command_names" => sub { return lc $command };
};

1;
