#!/usr/bin/perl

use strict;
use warnings;

use Test::More qw(no_plan);
use Test::Exception;
use Serengeti;

my $ctx = Serengeti::Context->new();

isa_ok($ctx, "Serengeti::Context");
isa_ok($ctx->js_ctx, "JavaScript::Context");

lives_ok {
    $ctx->load("examples/facebook/facebook.js");
};

ok($ctx->has_action("login"), "Example did contain 'Login' action");

