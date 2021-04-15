/* Capture the audio stream from user's microphone */
/* TODO Adapt the solution to the one described in Mozilla's tutorial
*   (https://developer.mozilla.org/en-US/docs/Web/API/MediaStream_Recording_API/Using_the_MediaStream_Recording_API) */
{
    let audioChunks = [];
    let m;

    navigator.mediaDevices.getUserMedia({audio: true})
        .then(stream => {
            processAudioStream(stream)
        })

    function processAudioStream(stream) {
        m = new MediaRecorder(stream)
        m.ondataavailable = e => {
            audioChunks.push(e.data);
            if (m.state === "inactive") {
                let blob = new Blob(audioChunks, {type: 'audio/mpeg-3'});
                document.getElementById("recordedAudio").src = URL.createObjectURL(blob);
                document.getElementById("recordedAudio").controls = true;
                document.getElementById("recordedAudio").autoplay = false;
                // TODO Send the recorded audio data to the server side
                // sendData(blob)
            }
        }
    }

    document.getElementById("record").onclick = e => {
        console.log("I was clicked")
        document.getElementById("record").disabled = true;
        document.getElementById("record").style.backgroundColor = "blue"
        document.getElementById("stopRecord").disabled = false;
        m.start()
    }

    document.getElementById("stopRecord").onclick = e => {
        console.log("I was clicked")
        document.getElementById("record").disabled = false;
        document.getElementById("stopRecord").disabled = true;
        document.getElementById("record").style.backgroundColor = "red"
        m.stop()
    }
}