// https://doc.sccode.org/Guides/OSC_communication.html
// https://doc.sccode.org/Tutorials/Server_Tutorial.html

// Client and Server architecture. `s` is the default variable for a server

// Basic interaction with the server:
// Boot the server
s.boot;

// Show the server address & port
s.addr;

// Quit the server
s.quit;

// Show the server output scope (time vs amplitude)
s.scope;

// Show the server input & output meter
s.meter;

// Create a server at localhost:57110, and set it as the default configuration
s = Server("localhost", NetAddr("127.0.0.1", 57110));
Server.default = s
Server.all // display all exisiting servers

// Declare a different server
n = Server.new("ECSESS", NetAddr("localhost", port: 58124));
n.boot; // works exactly like `s`

Server.killAll
Server.freeAll


// Create a different scsynth server at a different address
n = Server("Testing", NetAddr("127.0.0.1", 51021));
n.boot;
n.meter;

OSCFunc.trace(true); // Turn posting on
OSCFunc.trace(false); // Turn posting off

// stop the synth (delete it)
s.sendMsg("/n_free", n);

// Send a SynthDef to the server. This let the server know the structure of "mySine"

// SynthDef - It's like an object
// SynthDef(...) is the same as Synth.new(...)
(
y = SynthDef("sine", { |freq|
	Out.ar(0, SinOsc.ar(freq, 0, 0.1));
	Out.ar(1, SinOsc.ar(freq, 0, 0.1));
});
)
y.send(s);

// Close the server
s.quit();

FreqScope.new()

(
SynthDef("grain", {
    Out.ar(0, Line.kr(0.1, 0, 0.01, doneAction: Done.freeSelf) * FSinOsc.ar(12000))
}).send(s);
)

(
Routine({
    20.do({
        s.sendMsg("/s_new", "grain", -1);
        0.1.wait;
    })
}).play;
)

// Advanced use case: Multi-threading server
Server.supernova