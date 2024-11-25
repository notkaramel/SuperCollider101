// Using MIDI guide

s.boot;
// Making a note
(
SynthDef(\midifun, {
    arg freq = 550, amp = 0.5;
	var rootOsc = SinOsc.ar(freq, 1, amp);
    // Envelope the sound
	var envfunc = Env([1, 0.1, 0.5], [0.1, 0.3, 1], 'lin');
	var env = EnvGen.kr(envfunc, doneAction: Done.freeSelf);
    var sound = rootOsc * env;
	// sound = Splay.ar(sound)*amp;

	// sound = Pan2.ar(sound*amp, Rand(-1,1), 1);
	Out.ar(0, sound);
	Out.ar(1, sound);

	/*Out.ar(IRand(0,1), sound*amp);
	Out.ar(IRand(0,1), sound*amp);*/
}).add;
)
(
var notes, on, off;

MIDIClient.init;
MIDIIn.connectAll;

notes = Array.newClear(128);    // array has one slot per possible MIDI note

on = MIDIFunc.noteOn({ |veloc, num, chan, src|
    notes[num] = Synth(\midifun, [\freq, num.midicps,
        \amp, veloc * 0.00315]);
});

off = MIDIFunc.noteOff({ |veloc, num, chan, src|
    notes[num].release;
});

q = { on.free; off.free; };
)

// when done:
q.value;