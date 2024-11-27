// Looping

(
20.do({ |i|
	i.postln;
});
)

[1, 5, 3].do({ |i|
	i.postln;
});

// wait

t = Task({ { "Yippee".postln; 1.wait; }.loop});
t.start;
t.stop;

x = Routine( {
	"Howdy".postln;
	1.wait;
})

x.play();

//