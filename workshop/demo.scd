(
(
SynthDef(\note, {
    arg freq = 550, amp = 0.5;

	var rootOsc = SinOsc.ar(freq, Rand(0,pi), amp);
    // Envelope the sound
	// var env = EnvGen.kr(Env.perc(0.03, 1), doneAction: Done.freeSelf);

	var sound = rootOsc**2;
	// sound = Splay.ar(sound)*amp;

	//sound = Pan2.ar(sound*amp, 1);
	Out.ar(0, sound);
	Out.ar(1, sound);

	/*Out.ar(IRand(0,1), sound*amp);
	Out.ar(IRand(0,1), sound*amp);*/
}).add;
);
~fun1 = Synth.new(\note, [\freq, 550]);
// ~fun2 = Synth.new(\note, [\freq, 660]);
)

x = { SinOsc.ar(520, pi/2, 1) };
{ SinOsc.ar(540, pi, 1) }.play();
x.plot;
y = { x*SinOsc.kr(540, pi, 1) };
x.play;
y.play;

x.free;
y.free;
{ PinkNoise.ar() }.play();

( // Sound like a wave
x = {
	~env = EnvGen.kr(
		Env([0, 1, 0.4, 1, 0.7, 0]),
		doneAction: Done.freeSelf
	);
	// { PinkNoise.ar()}.plot();
	~noise = PinkNoise.ar() * ~env;
	~noise = Pan2.ar(~noise, 0);
	~noise = Pan2.ar(~noise, 1);
};
x.plot();
x.play();
// s.record(duration: 6);
)

FreqScope.new(500, 400, 0, server: s);


//~delayNoise = { ~noise * ~delayEnv }.play();
// { ~delayNoise }.play;
{ SinOsc.ar(448, pi/2, 1) }.play;
{ SinOsc.ar(660, 0, 0.5) }.play;
{ SinOsc.ar(880, 0, 0.5) }.play;

