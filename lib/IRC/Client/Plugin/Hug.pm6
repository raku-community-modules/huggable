use IRC::Client;
unit class IRC::Client::Plugin::Hug does IRC::Client::Plugin;

my $who-re = rx/[\s+ $<who>=(.+) || $<u-hug>='u' \s* $]?/;

method irc-privmsg ($e where /:i ^ \s* '.hug' $<who>=<$who-re>/ ) {
    self.hug: $/, $e;
}

method irc-addressed ($e where /:i ^ \s* 'hug' $<who>=<$who-re>/ ) {
    self.hug: $/, $e;
}

method hug ($/, $e) {
    my $who = $<who><u-hug> ?? 'you' !! $<who><who> // 'everyone';
    $who = $e.nick if $who.lc eq 'me';

    $.irc.send: :where($e.channel), :text("\o[001]ACTION hugs $who\o[001]");
}
