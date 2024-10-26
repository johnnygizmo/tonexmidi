let midi = null; // global MIDIAccess object
function onMIDISuccess(midiAccess) {
    console.log("MIDI ready!");
    window._midi = midiAccess; 
    window._midiOutput = 0;
    window._midiLastMsg = -1;
    window._midiLastValue = -1;
    window._midiLastTime = Date.now();

    listInputsAndOutputs(window._midi);
    window._midi.outputs.forEach((output) => {
        if(output.name == "ToneX MIDI Out"){
            window._midiOutput = output;
        }
        console.log(output.name); 
    });
    if( window._midiOutput == 0){
        alert("No ToneX Detected");
    }
}

function onMIDIFailure(msg) {
    console.error(`Failed to get MIDI access - ${msg}`);
    if( window._midiOutput == 0){
        alert("ToneX Connection Error");
    }
}

window.onload = () => {
    navigator.requestMIDIAccess().then(onMIDISuccess, onMIDIFailure);
    init();
}

function listInputsAndOutputs(midiAccess) {
    for (const entry of midiAccess.inputs) {
        const input = entry[1];
        console.log(
            `Input port [type:'${input.type}']` +
            ` id:'${input.id}'` +
            ` manufacturer:'${input.manufacturer}'` +
            ` name:'${input.name}'` +
            ` version:'${input.version}'`,
        );
    }

    for (const entry of midiAccess.outputs) {
        const output = entry[1];
        console.log(
            `Output port [type:'${output.type}'] id:'${output.id}' manufacturer:'${output.manufacturer}' name:'${output.name}' version:'${output.version}'`,
        );
    }
}


const init = () => {
    const cc = (msg, value) => {   
        if(Date.now() - window._midiLastTime < 10){
            return;
        }
        window._midiLastTime = Date.now();
        
        if(
            window._midiLastMsg != msg || 
            window._midiLastValue != value
            ){
                console.log("send "+msg+ " "+ value );
                console.log(window._midiOutput);
                window._midiOutput.send([0xB0, msg, value]);
                window._midiLastMsg = msg;
                window._midiLastValue = value;
        }
    }
    window._midiCC = cc;
}