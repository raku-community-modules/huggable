use IRC::Client::Plugin;
unit class IRC::Client::Plugin::Insult is IRC::Client::Plugin;

use Acme::Insult::Lala;
my $lala = Acme::Insult::Lala.new;

method irc-to-me ($irc, $e, %res) {
    return IRC_NOT_HANDLED
        unless %res<where> ~~ / ^ <[#&]> /
            and %res<what> ~~ /:i ^ 'insult' \s+ $<who>=(.+) \s* /;

    my $who = $<who>.lc eq 'me' ?? %res<who> !! $<who>;
    $who .= trim;
    my $insult = $lala.generate-insult;

    $irc.ssay: "PRIVMSG %res<where> :I think $who is { $insult ~~ /^<[aeiou]>/ ?? 'an' !! 'a' } $insult";
}
