# Workshop
- Prerequisite knowledge: Object Oriented Programming (OOP), Signal Processing in time domain, 

## Workshop organization
- The participants will be introduced to SuperCollider and familiarize with its syntacies
- In order of presentation, the participant will learn the following: (see [Presentation Notes](../presentation/README.md))
    - The SuperCollider IDE: Editor space
    - The Documentation
        - `Ctrl Shift D` to perform a quick search
    - Create & save a SuperCollider `.scd` file
    - Booting up a `localhost` server
    - Variables
        - Avoid single character as some are preserved (`s` for server)
        - Using `var variableName` or `~variableName`
        - Avoid `t_variable` because `t_` is reserved for trigger control
    - SynthDef and Synth
        - Arguments `arg`, or `| ..args |`
        - Sending/Adding SynthDef to the server
        - Playing the Synth by calling it
        - Setting the arguments as the synth is playing

    - Envelope
        - Curve levels
            - Linear, Exponential, 
        - `DoneAction: freeSelf`

## Performing & Recording
- To have the server record, follow the guide:
```scd
s.record;

s.pauseRecording; // pause the ongoing recording

s.record // start again, if needed

s.stopRecording; // this closes the file and deallocates the buffer recording node, etc.
```
### Presenter
- The presenter must compose ahead of time a series of notes such that it becomes a complete piece during recording.

### Participants
- The participants will send a `SynthDef` to the server to be played.
- The `SynthDef` can be as creative as the participants are able to. Recommended techniques:
    - Amplitude Modulation: Sin(freq) * Sin(sideband)
    - Frequency Modulation: Sin(freq*Sin(sideband))
