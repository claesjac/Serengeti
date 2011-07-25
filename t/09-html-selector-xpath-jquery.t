#!/usr/bin/perl

use strict;
use warnings;

use Test::More qw(no_plan);

BEGIN { use_ok("HTML::Selector::XPath::jQuery") }

for (qw(checkbox file image password radio reset submit text)) {
    is(
        HTML::Selector::XPath::jQuery->new(":$_")->to_xpath,
        qq{//*[\@type='$_']},
    );
}

is(
    HTML::Selector::XPath::jQuery->new(q{div:contains("Företag")})->to_xpath,
    q{//div[text()[contains(string(.),"Företag")]]}
);

is(
    HTML::Selector::XPath::jQuery->new(q{input[name='man']})->to_xpath,
    q{//input[@name='man']}
)
