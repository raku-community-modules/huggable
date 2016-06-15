use lib
    '/home/zoffix/services/huggable/temp/perl6-IRC-Client/lib',
    'lib';

use IRC::Client;
use IRC::Client::Plugin::Debugger;
use IRC::Client::Plugin::Hug;
use IRC::Client::Plugin::Insult;
use IRC::Client::Plugin::Factoid;

IRC::Client.new(
    :host(%*ENV<HUGGABLE_DEBUG> ?? '127.0.0.1' !! 'chat.freenode.net')
    :channels<#perl6 #p6dev #zofbot>
    :nick<huggable>
    :debug
    :plugins(
        IRC::Client::Plugin::Debugger.new,
	IRC::Client::Plugin::Insult.new,
        IRC::Client::Plugin::Hug.new,
        IRC::Client::Plugin::Factoid.new,
    )
).run;
