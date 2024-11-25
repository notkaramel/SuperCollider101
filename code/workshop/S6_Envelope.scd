// https://doc.sccode.org/Classes/Env.html
// https://doc.sccode.org/Classes/EnvGen.html

// Follow the documentation
Env.new(levels: [0, 1, 0.9, 0], times: [0.1, 0.5, 1], curve: 'lin').plot;

Env.new(levels: [0, 1, 0.9, 0], times: [0.1, 0.5, 1], curve: 'sine').plot;


// Different kinds of Env curves
// Triangle shape: Env.triangle(dur: 1.0, level: 1.0)
Env.triangle(1, 1).test.plot;

// Sine shape: Env.sine(dur: 1.0, level: 1.0)
Env.sine(1, 1).test.plot;

// Percussive shape: Env.perc(attackTime: 0.1, releaseTime: 1.0, level: 1.0, curve: -4.0)
Env.perc(attackTime: 0.01, releaseTime: 1.0, level: 1.0, curve: -4.0).test.plot;

// Use this as the envelope example:
Env.perc(0.2, 0.7, 1.0, -3.0).test.plot

(
{
    var env = Env([0, 1, 0.5, 1, 0], [0.01, 0.5, 0.02, 0.5]);
    SinOsc.ar(470) * EnvGen.kr(env, doneAction: Done.freeSelf)
}.play
)

{ PinkNoise.ar(EnvGen.kr(Env.perc, doneAction: Done.freeSelf)) }.play