use lib
    '/home/zoffix/CPANPRC/huggable/temp/perl6-IRC-Client/lib',
    'lib';

use IRC::Client;
use IRC::Client::Plugin::Debugger;
use IRC::Client::Plugin::Hug;
use IRC::Client::Plugin::Factoid;

IRC::Client.new(
    :host(%*ENV<HUGGABLE_DEBUG> ?? '127.0.0.1' !! 'irc.freenode.net')
    :channels<#perl6>
    :nick<huggable>
    :debug
    :plugins(
        IRC::Client::Plugin::Debugger.new,
        IRC::Client::Plugin::Hug.new,
        IRC::Client::Plugin::Factoid.new,
    )
).run;
