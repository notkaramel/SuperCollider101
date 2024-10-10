# Presentation Outline
> Built with Bun, Vite, and Reveal.js

## Step 1: Install SuperCollider
- Link: https://supercollider.github.io/downloads.html

## Step 2: Getting started
- Introduction/Live Demo to the IDE

## Step 3: SuperCollider Basics
- `SinOsc` to make a sine wave
- `{ SinOsc }` to make a function
- `{ SinOsc }.play` to play the note

- Variable:
    - `x` single character, not recommended because there are reserved/default variable (`s` for server)
    - `~blahblah` can follow any naming convention, very flexible

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

## Step 10: Let's start!
- Orchestrate the workshop

## Step 11: Perform & Record
