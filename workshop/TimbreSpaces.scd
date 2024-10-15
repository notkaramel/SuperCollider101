(
SynthDef(\sineNote, {
    arg freq = 550, amp = 0.5;
    var rootOsc = SinOsc.ar(freq, 1, amp);
    // Envelope the sound
	var env = EnvGen.kr(Env.perc(0.03, 1), doneAction: Done.freeSelf);
	var sound = rootOsc * env;

	sound = Pan2.ar(sound*amp, Rand(-1,1), 1);
	Out.ar(0, sound);

	/*Out.ar(IRand(0,1), sound*amp);
	Out.ar(IRand(0,1), sound*amp);*/
}).add;
)

Synth(\sineNote);

(
SynthDef(\timbreA, {
	arg freq1 = 400, freq2 = 600, freq3 = 800;
	var sin1 = SinOsc.ar(freq1, Rand(0, 2*pi), Rand(0,1));
	var sin2 = SinOsc.ar(freq2, Rand(0, 2*pi), Rand(0,1));
	var sin3 = SinOsc.ar(freq3, Rand(0, 2*pi), Rand(0,1));

	// ~envFunc = Env.new(levels: [0, 1, 0.9, 0], times: [0.1, 0.5, 4], curve: [-5, 0, -5]);
	var envFunc = Env.perc(attackTime: 0.1, releaseTime: 1.0, level: 1.0, curve: -4.0);
	var envelope = EnvGen.kr(envFunc, doneAction: Done.freeSelf);
	var outputSin = (sin1 * sin2 * sin3) * envelope;

	Out.ar(0, Pan2.ar(outputSin, Rand(-1,1), 1));
}).add;
)
Synth.new(\timbreA).play


(
SynthDef(\dualSine, {
	var freq1 = 400, freq2 = 800;
	~sin1 = SinOsc.ar(freq1, Rand(0, 2*pi), 0.5);
	~sin2 = SinOsc.ar(freq2, Rand(0, 2*pi), 0.5);

	~envFunc = Env.new(levels: [0, 1, 0.9, 0], times: [0.1, 0.5, 4], curve: [-5, 0, -5]);
	~envelope = EnvGen.ar(~envFunc, doneAction: Done.freeSelf);
	~outputSin = (~sin1 * ~sin2) * ~envelope;

	Out.ar(0, Pan2.ar(~outputSin, Rand(-1,1), 1));
}).add;
Synth.new(\dualSine).play
)

(
SynthDef(\addSine, {
	var freq1 = 400, freq2 = 800;
	~sin1 = SinOsc.ar(freq1, Rand(0, 2*pi), 0.5);
	~sin2 = SinOsc.ar(freq2, Rand(0, 2*pi), 0.5);

	~envFunc = Env.new(levels: [0, 1, 0.9, 0], times: [0.1, 0.5, 4], curve: [-5, 0, -5]);
	~envelope = EnvGen.ar(~envFunc, doneAction: Done.freeSelf);
	~outputSin = (~sin1 + ~sin2) * ~envelope;

	Out.ar(0, Pan2.ar(~outputSin, 0, 1));
}).add;
Synth.new(\addSine).play
)

(
SynthDef(\ShakerSine, {
	var freq = 10;
	~sin = SinOsc.ar(freq, Rand(0, 2*pi), 0.5);
	~noise = ClipNoise.ar(1);

	~envFunc = Env.new(levels: [0, 1, 0.9, 0], times: [0.1, 0.5, 4], curve: [-5, 0, -5]);
	~envelope = EnvGen.ar(~envFunc, doneAction: Done.freeSelf);
	~outputSin = (~sin * ~noise) * ~envelope;

	Out.ar(0, Pan2.ar(~outputSin, 0, 1));
}).add;
Synth.new(\ShakerSine).play
)


// Sounds like a snare
(
SynthDef(\Puff, {
    arg freq = 550, amp = 0.5;
	var rootOsc = WhiteNoise.ar(1);
    // Envelope the sound
	var env = EnvGen.kr(Env.perc(0.03, 1), doneAction: Done.freeSelf);
	var sound = rootOsc * env;

	sound = Pan2.ar(sound*amp, 0, 1);
	Out.ar(0, sound);
}).add;
Synth(\Puff);
)



(
SynthDef(\Baff, {
    arg freq = 12, amp = 0.5;
	var rootOsc = WhiteNoise.ar(1) * SinOsc.ar(freq, 2*pi, 1);
    // Envelope the sound
	var env = EnvGen.kr(Env.perc(0.02, 1), doneAction: Done.freeSelf);
	var sound = rootOsc * env;

	sound = Pan2.ar(sound*amp, 0, 1);
	Out.ar(0, sound);
}).add;
Synth(\Baff);
)

(
SynthDef(\Brrr, {
    arg freq = 3, amp = 0.5;
	var rootOsc = BrownNoise.ar(SinOsc.ar(freq, 2*pi, 1));
    // Envelope the sound
	var env = EnvGen.kr(Env.perc(0.02, 1), doneAction: Done.freeSelf);
	var sound = rootOsc * env;

	sound = Pan2.ar(sound*amp, 0, 1);
	Out.ar(0, sound);
}).add;
Synth(\Brrr);
)

(
SynthDef(\Vibrato, {
    arg freq = 440, gap = 5, amp = 0.5;
	var rootOsc = SinOsc.ar([freq, freq+gap, freq+2*gap], 0, 1);
    // Envelope the sound
	var env = EnvGen.kr(Env.perc(0.02, 1), doneAction: Done.freeSelf);
	var sound = rootOsc * env;

	sound = Pan2.ar(sound*amp, 0, 1);
	Out.ar(0, sound);
}).add;
Synth(\Vibrato);
)

(
SynthDef(\FM, {
    arg freq = 400, freqFM = 200, amp = 0.6;
	var rootOsc = SinOsc.ar(freq * SinOsc.ar(freqFM, 2*pi, 1), Rand(0, 2*pi));
    // Envelope the sound
	var env = EnvGen.kr(Env.perc(0.02, 1), doneAction: Done.freeSelf);
	var sound = rootOsc * env;

	sound = Pan2.ar(sound*amp, 0, 1);
	Out.ar(0, sound);
}).add;
Synth(\FM);
)

// Robot noises
{ SinOsc.ar(LFNoise0.kr(10).range(400, 12000)) }.play;

(
x = Routine({
	10.do({
		Synth(\FM, [\freq, 68.midicps]);
		Synth(\dualSine, [\freq1, 68.midicps]);
		Synth(\ShakerSine, [\amp, 0.3]);
		Synth(\Vibrato, [\freq, 80.midicps]);
		0.24.wait;
		Synth(\FM, [\freq, 65.midicps]);
		Synth(\Puff);
		Synth(\Baff);
		Synth(\Vibrato, [\freq, 67.midicps]);
		0.24.wait;
		Synth(\FM);
		0.24.wait;
		Synth(\FM, [\freq, 60.midicps]);
		Synth(\Vibrato, [\freq, 67.midicps]);
		Synth(\Brrr);
	})
});
x.play();
)

s.record
s.scope
s.plot

