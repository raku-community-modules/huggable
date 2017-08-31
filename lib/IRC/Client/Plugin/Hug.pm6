use IRC::Client;
unit class IRC::Client::Plugin::Hug does IRC::Client::Plugin;

my $who-re = rx/[ $<num> = \d+ || \s+ $<who>=(.+) || $<u-hug>='u' \s* $]?/;

method irc-privmsg ($e where /:i ^ \s* '.hug' $<who>=<$who-re>/ ) {
    self.hug: $/, $e;
}

method irc-addressed ($e where /:i ^ \s* 'hug' $<who>=<$who-re>/ ) {
    self.hug: $/, $e;
}

method hug ($/, $e) {
    my $who = $<who><u-hug> ?? 'you' !! $<who><who> // 'everyone';
    $who = $e.nick if $who.lc eq 'me';

    if $<who><num> -> $_ {
        when 1 { "Hug 1: Gift a Shovel. Always seek to expand our community. Invite people to help us. https://rakudo.party/post/On-Troll-Hugging-Hole-Digging-and-Improving-Open-Source-Communities#hug1:giftashovel" }
        when 2 { "Hug 2: Feed The Hand That Bites You. Always assume positive intent behind people's words and actions. https://rakudo.party/post/On-Troll-Hugging-Hole-Digging-and-Improving-Open-Source-Communities#hug2:feedthehandthatbitesyou" }
        when 3 { "Hug 3: We All Leave Footprints. What you do today, the others will follow and do tomorrow. https://rakudo.party/post/On-Troll-Hugging-Hole-Digging-and-Improving-Open-Source-Communities#hug3:weallleavefootprints" }
        when 4 { "Hug 4: Speak Up. Point out unwanted behaviour, regardless of who you are and who the offender is. https://rakudo.party/post/On-Troll-Hugging-Hole-Digging-and-Improving-Open-Source-Communities#hug4:speakup" }
        when 5 { "Hug 5: Simply a Hug. A simple hug is a positive interruption. https://rakudo.party/post/On-Troll-Hugging-Hole-Digging-and-Improving-Open-Source-Communities#hug5:simplyahug" }
        when 6 { "Hug 6: Love Others. People are more important than code. https://rakudo.party/post/On-Troll-Hugging-Hole-Digging-and-Improving-Open-Source-Communities#hug6:loveothers" }
        when 7 { "Hug 7: Go For The Third Option. Instead of me being right and you being wrong we both could be right-ish. https://rakudo.party/post/On-Troll-Hugging-Hole-Digging-and-Improving-Open-Source-Communities#hug7:goforthethirdoption" }
        "I don't know about Hug {+$_}. Perhaps we could make it?"
    }
    else {
        $.irc.send: :where($e.channel), :text("\o[001]ACTION hugs $who\o[001]");
    }
}
