// https://doc.sccode.org/Guides/Multichannel-Expansion.html

{ SinOsc.ar([400, 0], 0.0, 0.5, 0.0) }.play;
{ SinOsc.ar([0, 400], 0.0, 0.5, 0.0) }.play;
 // to see the channels
s.meter

// Output a synth
Out.ar(bus:0, mySynth);
Out.ar(bus:1, mySynth);

// one channel
{ Blip.ar(800,4,0.1) }.play;

// two channels in an array
{ [ Blip.ar(800,4,0.1), WhiteNoise.ar(0.1) ] }.play;

// two frequencies in an array
{ SinOsc.ar([440, 880], 0, 0.2) }.play;

(
{
    ~sound1 = SinOsc.ar(300,0,0.3);
    ~sound2 = Saw.ar(440, 0.2);
	~sound3 = SinOsc.ar(440);
	Out.ar([0,1], [~sound1, ~sound2]); // the proper way
	// Out.ar(0, [~sound1, ~sound2, ~sound3]);     // using multichannel expansion
}.play;
)
s.meter