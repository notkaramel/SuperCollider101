// Run things via `sclang`

#!/usr/bin/env sclang
// -- THIS FILE IS FOR DEMO ONLY --
// This file is executable from the terminal.

s = Server("SuperCollider", NetAddr("127.0.0.1", 57110));
s.boot;
s.addr;

SynthDef(\walk, { | xPosition = 0, yPosition = 0 |
    var freq = 100, amp = 0.7;
    var sound = SinOsc.ar(freq, 1, amp);
    var out = sound * EnvGen.kr(Env.perc(0.3 * yPosition, 1), doneAction: Done.freeSelf);
	Out.ar(0, Pan2.ar(out, xPosition, 1));
}).load(s);

// Looping
(
20.do({ |i|
	i.postln;
});
)

[1, 5, 3].do({ |i|
	i.postln;
});

// wait

t = Task({ { "Yippee".postln; 1.wait; }.loop});
t.start;
t.stop;

x = Routine( {
	"Howdy".postln;
	1.wait;
})

x.play();

// Play multiple notes
(
x = Routine( {
	{ SinOsc.ar(64.midicps, Rand(0,2*pi)) * EnvGen.kr(Env([0, 1, 0.5], [0.01, 0.5]), doneAction: 2) }.play();
	1.wait;
	{ SinOsc.ar(68.midicps, Rand(0,2*pi)) * EnvGen.kr(Env([0, 1, 0], [0.5, 0.02, 0.5]), doneAction: 2) }.play();
});
)
x.play