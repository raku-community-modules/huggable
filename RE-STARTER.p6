loop {
    my $p = Proc::Async.new: "perl6", "bin/huggable.p6";
    $p.stdout.tap: -> $v { $*OUT.print: $v }
    $p.stderr.tap: -> $v { $*ERR.print: $v }
    $p.start;
    sleep 4*60*60;
    $p.kill;
}
