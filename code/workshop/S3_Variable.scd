// Create a function with { }
a = { SinOsc.ar(440) }; // A4
a.play();

// Stop the synth with `Ctrl + .`

// Long variable name
~longerNamedVariable = { SinOsc.ar([400, 401], 0, 0.1) * EnvGen.kr(Env.sine(10)) };
~longerNamedVariable.play()
~longerNamedVariable.stop()