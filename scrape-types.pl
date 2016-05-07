#!/usr/bin/env perl

use 5.022;
use Mojo::Util qw/slurp/;
use Mojo::UserAgent;
use Mojo::SQLite;
use Acme::Dump::And::Dumper;

my @types = Mojo::UserAgent->new->get('http://docs.perl6.org/type.html')
    ->res->dom->find('#content table tbody tr')->map(sub{
        +{
            fact => $_->at('td:first-child + td a')->all_text,
            def  => $_->at('td:last-child')->all_text
                    . ': https://docs.perl6.org' . $_->at('td:first-child + td a')->{href},
        }
    })->each;

my $db = Mojo::SQLite->new('sqlite:factoids.db')->db;

$db->query('DELETE FROM factoids');

my $tx = $db->begin;
$db->query('INSERT INTO factoids (fact, def) values (?, ?)', @$_{qw/fact def/})
    for @types;

$tx->commit;
