use IRC::Client::Plugin;
unit class IRC::Client::Plugin::Hug is IRC::Client::Plugin;

method irc-to-me ($irc, $e, %res) {
    return IRC_NOT_HANDLED
        unless %res<where> ~~ / ^ <[#&]> /
            and %res<what> ~~ /:i ^ 'hug' \s+ $<who>=(.+) \s* /;

    my $who = $<who>.lc eq 'me' ?? %res<who> !! $<who>;
    $irc.ssay: "PRIVMSG %res<where> :\o[001]ACTION hugs $who\o[001]"
}
