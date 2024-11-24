// OSC Workshop demo

// Start with simple Sinusoid Oscillator

// Hello World
"Hello World!".postln;

/*
 Execute
 multiple
 lines
*/
(
"Hello World!".postln;
"I'm at ECSESS Workshop!!".post;
)

// Create a function with { }
a = { SinOsc.ar(440) }; // A4
a.play();

// Stop the synth with `Ctrl + .`
a.free
a.scope
a.plot
a.stop

~longerNamedVariable = { SinOsc.ar([400, 401], 0, 0.1) * EnvGen.kr(Env.sine(10)) };
~longerNamedVariable.play()

x = { SinOsc.ar([400, 403], 0.0, 0.5, 0.0) };
x.play();
x.free;
x.stop;

// SynthDef - It's like an object
// SynthDef(...) is the same as Synth.new(...)
y = SynthDef("mySine", { Out.ar(0, SinOsc.ar(440, 0, 0.2)) });
y.play()
y.stop;

// Client and Server architecture. `s` is the default variable for a server
s = Server("EpicECSESS", NetAddr("127.0.0.1", 57130)); // Create a server at localhost:57110
s.boot();
s.quit();
s = Server("Testing", NetAddr("127.0.0.1", 51021));
Server.supernova
Server.all
Server.killAll
t = Server.remote(\remote, NetAddr("localhost", 51021),o);
t.makeWindow
// OSC message


// stop the synth (delete it)
s.sendMsg("/n_free", n);

// Send a SynthDef to the server. This let the server know the structure of "mySine"
y.send(s);
y.play();

// Close the server
s.quit();




