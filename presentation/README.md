# Presentation

## Why use OSC? What is SuperCollider

- *Open SoundControl* is a communication "protocol for computers, sound synthesizers, and other multimedia devices that is optimized for modern networking."
- "OSC is designed as a highly accurate, low latency, lightweight, and flexible method of communication for use in realtime musical performance"
- [OpenSourceControl website](https://opensoundcontrol.stanford.edu)
- [OSC Proposal at ICMC, 1997](https://ccrma.stanford.edu/groups/osc/files/1997-ICMC-OSC.pdf)

- In a way, OSC is a more flexible alternative to MIDI which was a protocol standard made for hardware synthesizer with electrical circuit limitations. Meanwhile, OSC travels through the internet via UDP (or User Datagram Protocol).

- In this workshop, we will <b>not</b> go into the encoding of OSC and all the nitty gritty details of it. We will use a program called <b>SuperCollier</b> to use and interact directly with OSC and create an application using it.

## Outline
- All the steps
  - Install SuperCollider
  - Introduction to the IDE
  - Basics: Variable, simple sinusoid function, `UGen`
  -

## Step 1: Install SuperCollider
- Link: [SuperCollider](https://supercollider.github.io/downloads.html)
- On Linux: install `supercollider` package from your package manager

## Step 2: Getting started
- Introduction/Live Demo of the IDE
- Showing:
  - The editor
  - Help Browser: Documentation
  - Post Window: Status 
  - Status bar: Interpreter & Server Status
- Create a "Hello World" program
- [Getting Started tutorial!](https://doc.sccode.org/Tutorials/Getting-Started/00-Getting-Started-With-SC.html)


## Step 3: SuperCollider Basics

- `SinOsc` to make a sine wave
- `{ SinOsc }` to make a function
- `{ SinOsc }.play` to play the note

- Variable:
  - `x` single character, not recommended because there are reserved/default variable (`s` for server)
  - `~blahblah` can follow any naming convention, very flexible
- `UGen`
  - `ar`: Audio rate, the data is produced/output values 44100 or 48000 times per second. Use this for sound production.
  - `kr`: Control rate, the data is produced a value every 64 samples, using less CPU. We use this to control or shape other `Ugen`s.

## Step 4: Synth & SynthDef

- Create a synth with name. It's like a `Class` in OOP concepts
- `args`

## Step 5: Signal Processing

- Sin wave, Noise, ... in convolution
- Modulation: AM, FM

## Step 6: Envelope

- Adding an envelope function to the signal to create a note

## Step 7: Output & Panning

- Sending sound to the output, with panning function to allow spacialized audio
- [Head-related transfer function (HRTF)](https://en.wikipedia.org/wiki/Head-related_transfer_function)

## Step 8: Timbre

- Start sectioning the workshops into different timbre sections

## Step 9: SC Server, OSC ✨, Workshop Setup

- How SC Server communicate with SC Client and synthesize audio (Architecture)
- OSC message basics
- (Local) Network Port
- Booting up the server

## Step 10: Let's start

- Orchestrate the workshop

## Step 11: Perform & Record
