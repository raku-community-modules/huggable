use IRC::Client;
unit class IRC::Client::Plugin::Hug does IRC::Client::Plugin;
method irc-addressed ($e where /:i ^ \s* 'hug' \s+ $<who>=(.+)/ ) {
    my $who = $<who>.lc eq 'me' ?? $e.nick !! $<who>;
    $.irc.send: :where($e.channel), :text("\o[001]ACTION hugs $who\o[001]");
}
