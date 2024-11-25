// https://doc.sccode.org/Guides/OSC_communication.html
// https://doc.sccode.org/Tutorials/Server_Tutorial.html

NetAddr.langPort;    // retrieve the current port SC is listening to
NetAddr.localAddr    // retrieve the current IP and port
thisProcess.openPorts; // list all open ports

// Client and Server architecture. `s` is the default variable for a server
s = Server("EpicECSESS", NetAddr("127.0.0.1", 57130)); // Create a server at localhost:57110
s.boot();
s.quit();
s = Server("Testing", NetAddr("127.0.0.1", 51021));
Server.supernova
Server.all
Server.killAll

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