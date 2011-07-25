package Dur::Types;
use MooseX::Types -declare => [
    qw[
        Manifest
        Location
        Option

        ArrayOfOptions
        ArrayOfLocations

        OptionStr
        OptionTuple
        OptionHash

        LocationHash
    ]
];

use MooseX::Types::Moose ':all';
use MooseX::Types::Structured 'Tuple', 'Optional', 'Dict';

class_type Manifest, { class => 'Dur::Manifest' };
class_type Location, { class => 'Dur::Location' };
class_type Option,   { class => 'Dur::Option' };

subtype OptionStr,   as Str;
subtype OptionTuple, as Tuple[Str, Optional[Str]];
subtype OptionHash,  as HashRef[Str|Undef], where { keys %$_ == 1 }, message { "Hash has more than one key" };

subtype ArrayOfOptions,   as ArrayRef[Option];

subtype LocationHash, as Dict[name => Str, path => Str, options => Optional[ArrayRef]];
subtype ArrayOfLocations, as ArrayRef[Location];

coerce Option, from Str,         via { Dur::Option->new( value => [ $_ ] ) };
coerce Option, from OptionTuple, via { Dur::Option->new( value => $_ )  };
coerce Option, from OptionHash,  via {
    my ($k, $v) = %$_;
    my $p = length $k > 1 ? '--' : '-';
    return Dur::Option->new(value => [ "$p$k" ]) if not defined $v;
    return Dur::Option->new(value => [ "$p$k", $v ]);
};

coerce ArrayOfOptions,
    from ArrayRef[OptionStr | OptionTuple | OptionHash],
    via { [ map { to_Option($_) } @$_ ] };


coerce Location, from LocationHash, via { require Dur::Location; Dur::Location->new($_) };

coerce ArrayOfLocations,
    from ArrayRef[LocationHash],
    via { [ map { to_Location($_) } @$_ ] };




1;
