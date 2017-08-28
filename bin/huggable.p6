use lib <
    /home/zoffix/CPANPRC/IRC-Client/lib
    /home/zoffix/CPANPRC/IRC-Client-Plugin-Factoid/lib

    /home/zoffix/services/lib/IRC-Client/lib
    /home/zoffix/services/lib/IRC-Client-Plugin-Factoid/lib
    lib
>;


use IRC::Client;
use IRC::Client::Plugin::Hug;
use IRC::Client::Plugin::Factoid;

IRC::Client.new(
    :host(%*ENV<HUGGABLE_DEBUG> ?? '127.0.0.1' !! 'chat.freenode.net')
    :channels<#perl6 #perl6-dev #zofbot #moarvm>
    :nick<huggable>
    :username<zofbot-huggable>
    :debug
    :plugins(
        IRC::Client::Plugin::Hug.new,
        IRC::Client::Plugin::Factoid.new,
    )
).run;
