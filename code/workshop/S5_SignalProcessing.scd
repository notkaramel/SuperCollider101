// 5.1. Basic functions
{ SinOsc.ar(234) }.play;

{ Pulse.ar(234) }.play;

{ Saw.ar(234) }.play;

// Pop up the scope to see the output 
s.scope;

// Brown Noise
BrownNoise.ar(mul: 1.0, add: 0.0);
 
// White Noise
WhiteNoise.ar(mul: 1.0, add: 0.0);
 
// Step Noise
LFDNoise0.ar(freq: 500.0, mul: 1.0, add: 0.0)
 
// Pink Noise
Pink.ar(mul: 1.0, add: 0.0);

// Frequency scopes: Spectrum analyzer on one channel
FreqScope(500, 400, 0, s);


// You can go crazy with the notes by performing signal manipulation
// Common techniques:
// - Amplitude Modulation
// - Frequency Modulation
// - Additive Synthesis
// - Subtractive Synthesis
(
SynthDef(\sineNote, {
    arg freq = 550, amp = 0.5;
    var rootOsc = SinOsc.ar(freq, 1, amp);
    // Envelope the sound
	var env = EnvGen.kr(Env.perc(0.03, 1), doneAction: Done.freeSelf);
	var sound = rootOsc * env;

	sound = Pan2.ar(sound*amp, Rand(-1,1), 1);
	Out.ar(0, sound);
}).add;
)

Synth(\sineNote, [\freq, 440]);

(
SynthDef(\threeSin, {
	arg freq1 = 400, freq2 = 600, freq3 = 800;
	var sin1 = SinOsc.ar(freq1, Rand(0, 2*pi), Rand(0,1));
	var sin2 = SinOsc.ar(freq2, Rand(0, 2*pi), Rand(0,1));
	var sin3 = SinOsc.ar(freq3, Rand(0, 2*pi), Rand(0,1));

	var envFunc = Env.perc(attackTime: 0.1, releaseTime: 1.0, level: 1.0, curve: -4.0);
	var envelope = EnvGen.kr(envFunc, doneAction: Done.freeSelf);
	var outputSin = (sin1 + sin2 + sin3) * envelope;

	Out.ar(0, Pan2.ar(outputSin, Rand(-1,1), 1));
}).add;
)
Synth.new(\threeSin).play


(
SynthDef(\AM, {
	var freq1 = 400, freq2 = 800;
	~sin1 = SinOsc.ar(freq1, Rand(0, 2*pi), 0.5);
	~sin2 = SinOsc.ar(freq2, Rand(0, 2*pi), 0.5);

	~envFunc = Env.new(levels: [0, 1, 0.9, 0], times: [0.1, 0.5, 4], curve: [-5, 0, -5]);
	~envelope = EnvGen.ar(~envFunc, doneAction: Done.freeSelf);
	~outputSin = (~sin1 * ~sin2) * ~envelope;

	Out.ar(0, Pan2.ar(~outputSin, Rand(-1,1), 1));
}).add;
)
Synth.new(\AM).play

(
SynthDef(\additiveSine, {
	var freq1 = 400, freq2 = 800;
	~sin1 = SinOsc.ar(freq1, Rand(0, 2*pi), 0.5);
	~sin2 = SinOsc.ar(freq2, Rand(0, 2*pi), 0.5);

	~envFunc = Env.new(levels: [0, 1, 0.9, 0], times: [0.1, 0.5, 4], curve: [-5, 0, -5]);
	~envelope = EnvGen.ar(~envFunc, doneAction: Done.freeSelf);
	~outputSin = (~sin1 + ~sin2) * ~envelope;

	Out.ar(0, Pan2.ar(~outputSin, 0, 1));
}).add;
)
Synth.new(\additiveSine).play

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
)

Synth.new(\ShakerSine).play

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
)

// Sounds like a snare
Synth(\Puff);

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
)

Synth(\Baff);

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
)
// Sounds like a boot
Synth(\Brrr);

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
)

// Listen to a vibrato
Synth(\Vibrato);

(
SynthDef(\FM, {
    arg freq = 400, freqFM = 400, amp = 0.6;
	var rootOsc = SinOsc.ar(freq * SinOsc.ar(freqFM, 2*pi, 1), Rand(0, 2*pi));
    // Envelope the sound
	var env = EnvGen.kr(Env.perc(0.02, 1), doneAction: Done.freeSelf);
	var sound = rootOsc * env;

	sound = Pan2.ar(sound*amp, 0, 1);
	Out.ar(0, sound);
}).add;
)

// Listen to Frequency Modulation
Synth(\FM);

// Robot noises
{ Pan2.ar(SinOsc.ar(LFNoise0.kr(Rand(30, 60)).range(200, 6000), mul:0.42))}.play;

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
		0.48.wait;
		Synth(\FM, [\freq, 60.midicps]);
		Synth(\Vibrato, [\freq, 67.midicps]);
		Synth(\Brrr);
	})
});
x.play();
)
