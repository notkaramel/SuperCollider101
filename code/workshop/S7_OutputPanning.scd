// https://doc.sccode.org/Guides/Multichannel-Expansion.html

x = { SinOsc.ar([400, 403], 0.0, 0.5, 0.0) };

 // to see the channels
s.meter

// Output a synth
Out.ar(bus:0, mySynth);
Out.ar(bus:1, mySynth);