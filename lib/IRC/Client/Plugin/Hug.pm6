unit class IRC::Client::Plugin::Hug;
method irc-addressed ($e where /:i ^ \s* 'hug' \s+ $<who>=(.+)/ ) {
    my $who = $<who>.lc eq 'me' ?? $e.nick !! $<who>;
    "\o[001]ACTION hugs $who\o[001]";
}
