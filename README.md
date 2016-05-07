# huggable

Perl 6 IRC bot that lurks in irc.freenode.net/perl6

# INSTALLATION

    git clone https://github.com/zoffixznet/huggable.git
    cd huggable
    zef --depsonly install .

# RUNNING

    perl6 bin/huggable.p6

Due to my currently incomplete/buggy implementation of IRC::Client, the bot
will often disconnet and not reconnect. That's why there's a
RE-STARTER.p6 script to kill/restart the bot every 4 hours:

    perl6 RE-STARTER.p6

----

# KNOWN RUNNING INSTANCES

User `huggable` on `irc.freenode.net`; sits in channel `#perl6`

# REPOSITORY

Fork this bot on GitHub:
https://github.com/zoffixznet/huggable

# BUGS

To report bugs or request features, please use
https://github.com/zoffixznet/huggable/issues

# AUTHOR

Zoffix Znet (http://zoffix.com/)

# LICENSE

You can use and distribute this module under the terms of the
The Artistic License 2.0. See the `LICENSE` file included in this
distribution for complete details.
