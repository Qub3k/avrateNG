/* The code below comes from Mozilla's Web Dictaphone app:
*   https://github.com/mdn/web-dictaphone
*
* The code was modified by Jakub Nawała to satisfy the requirements of the "ACR Without the Scale" experiment.
*/

// TODO 1. Remove the elements not necessary from the point of view of the ACR w/o the Scale experiment (e.g., the
//  functionality of storing the clips)
// TODO 2. Store the recorded speech sample on the disk

// set up basic variables for app

let audio_recording_blob;


const record = document.querySelector('.record');
const stop = document.querySelector('.stop');
const soundClips = document.querySelector('.sound-clips');
const canvas = document.querySelector('.visualizer');
const mainSection = document.querySelector('.main-controls');

const audio_limit = 1;
let audio_index = 0;

// disable stop button while not recording
stop.disabled = true;


// visualiser setup - create web audio api context and canvas

let audioCtx;
const canvasCtx = canvas.getContext("2d");

//main block for doing the audio recording

if (navigator.mediaDevices.getUserMedia) {
    console.log('getUserMedia supported.');

    const constraints = {audio: true};
    let chunks = [];

    let onSuccess = function (stream) {
        const options = {
            audioBitsPerSecond: 128000,
            mimeType: "audio/webm; codecs=opus"
        }
        const mediaRecorder = new MediaRecorder(stream, options);

        visualize(stream);

        function start_recording(){
            mediaRecorder.start();
            console.log(mediaRecorder.state);
            console.log("recorder started");
            record.style.background = "red";

            stop.disabled = false;
            record.disabled = true;
        }
        start_recording();

        function stop_recording() {
            mediaRecorder.stop();
            console.log(mediaRecorder.state);
            console.log("recorder stopped");
            record.style.background = "";
            record.style.color = "";
            // mediaRecorder.requestData();

            stop.disabled = true;
            stop.style.visibility = "hidden";
            record.disabled = false;
            // Enable the submit button once a speech sample has been recorded
            document.getElementById("submitButton").removeAttribute("disabled")
        }
        stop.addEventListener("click", stop_recording);

        mediaRecorder.onstop = function (e) {
            console.log("data available after MediaRecorder.stop() called.");

            //const clipName = prompt('Enter a name for your sound clip', 'My unnamed clip');
            audio_index += 1;
            const clipName = "audio_"+audio_index+".webm";

            if (audio_index >= audio_limit){
                record.disabled = true
                stop.disabled = true
            }

            const clipContainer = document.createElement('article');
            const clipLabel = document.createElement('p');
            const audio = document.createElement('audio');
            const deleteButton = document.createElement('button');

            clipContainer.classList.add('clip');
            audio.setAttribute('controls', '');
            deleteButton.textContent = 'Delete';
            deleteButton.className = 'delete';

            if (clipName === null) {
                clipLabel.textContent = 'My unnamed clip';
            } else {
                clipLabel.textContent = clipName;
            }

            clipContainer.appendChild(audio);
            clipContainer.appendChild(clipLabel);
            //clipContainer.appendChild(deleteButton);
            soundClips.appendChild(clipContainer);

            audio.controls = true;
            audio_recording_blob = new Blob(chunks, {"type": "audio/webm; codecs=opus"});
            chunks = [];
            const audioURL = window.URL.createObjectURL(audio_recording_blob);
            audio.src = audioURL;
            console.log("recorder stopped");

            deleteButton.onclick = function (e) {
                let evtTgt = e.target;
                evtTgt.parentNode.parentNode.removeChild(evtTgt.parentNode);

                audio_index -= 1;
                if(audio_index<audio_limit){
                    record.disabled = false;
                }
                if(audio_index == 0){
                    document.getElementById("submitButton").setAttribute("disabled", true);
                }
            }

            // Pause audio playback after clicking submit button
            document.getElementById("submitButton").onclick = () =>{
                audio.pause();
            }

            clipLabel.onclick = function () {
                const existingName = clipLabel.textContent;
                const newClipName = prompt('Enter a new name for your sound clip');
                if (newClipName === null) {
                    clipLabel.textContent = existingName;
                } else {
                    clipLabel.textContent = newClipName+".webm";
                }
            }

        }

        mediaRecorder.ondataavailable = function (e) {
            chunks.push(e.data);
        }
    }

    let onError = function (err) {
        console.log('The following error occured: ' + err);
    }

    navigator.mediaDevices.getUserMedia(constraints).then(onSuccess, onError);

}
else {
    console.log('getUserMedia not supported on your browser!');
}

function visualize(stream) {
    if (!audioCtx) {
        audioCtx = new AudioContext();
    }

    const source = audioCtx.createMediaStreamSource(stream);

    const analyser = audioCtx.createAnalyser();
    analyser.fftSize = 2048;
    const bufferLength = analyser.frequencyBinCount;
    const dataArray = new Uint8Array(bufferLength);

    source.connect(analyser);
    //analyser.connect(audioCtx.destination);

    draw()

    function draw() {
        const WIDTH = canvas.width
        const HEIGHT = canvas.height;

        requestAnimationFrame(draw);

        analyser.getByteTimeDomainData(dataArray);

        canvasCtx.fillStyle = 'rgb(200, 200, 200)';
        canvasCtx.fillRect(0, 0, WIDTH, HEIGHT);

        canvasCtx.lineWidth = 2;
        canvasCtx.strokeStyle = 'rgb(0, 0, 0)';

        canvasCtx.beginPath();

        let sliceWidth = WIDTH * 1.0 / bufferLength;
        let x = 0;


        for (let i = 0; i < bufferLength; i++) {

            let v = dataArray[i] / 128.0;
            let y = v * HEIGHT / 2;

            if (i === 0) {
                canvasCtx.moveTo(x, y);
            } else {
                canvasCtx.lineTo(x, y);
            }

            x += sliceWidth;
        }

        canvasCtx.lineTo(canvas.width, canvas.height / 2);
        canvasCtx.stroke();

    }
}

window.onresize = function () {
    canvas.width = mainSection.offsetWidth;
}

window.onresize();


