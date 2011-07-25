package HTML::Selector::XPath::jQuery;

use strict;
use warnings;

use base qw(HTML::Selector::XPath);

my %INPUT_TYPE = (
    checkbox    => 1,
    file        => 1,
    image       => 1,
    password    => 1,
    radio       => 1,
    reset       => 1,
    submit      => 1,
    text        => 1,
);

sub parse_pseudo {
    my $self = shift;
	my ($pseudo) = @_;

    if (exists $INPUT_TYPE{$pseudo}) {
        return "[\@type='${pseudo}']";
    }

    if ($pseudo =~ m{contains\((.*)}) {
        my $text = $1;
        if (defined $_[2] && $_[2] =~ /(.*?)\)/) {
            if (defined $1) {
                my $got = $1;
                $_[2] =~ s/$1\)//;
                $text .= $got;
            }
        }
        else {
            chop $text if substr($text, -1, 1) eq ")";
        }
        
        $text = substr($text, 1, -1) if $text =~ /^'.*'$/;
        return qq{[contains(., '$text')]};
    }
    
    return;
}

1;
__END__

=head1 NAME

HTML::Selector::XPath::jQuery - HTML::Selector::XPath subclass with support 
for some of the :selectors from jQuery

=cut