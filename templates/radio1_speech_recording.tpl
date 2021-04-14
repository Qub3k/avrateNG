<!-- this template defines a radio button form.
When creating custom forms copy this basic structure.
Don't change the form attributes "action" and "method"-->


<div class="container">
  <form id="form1" action="/save_rating?video_index={{video_index}}" method="post">

      <div class="funkyradio">
        <div class="funkyradio-success">
          <input type="radio" name="radio" id="radio5" value="5" required/>
          <label for="radio5"><h5>5 - Excellent</h5></label>
        </div>
        <div class="funkyradio-success">
          <input type="radio" name="radio" id="radio4" value="4" required/>
          <label for="radio4"><h5>4 - Good</h5></label>
        </div>
        <div class="funkyradio-success">
          <input type="radio" name="radio" id="radio3" value="3" required/>
          <label for="radio3"><h5>3 - Fair</h5></label>
        </div>
        <div class="funkyradio-success">
          <input type="radio" name="radio" id="radio2" value="2" required/>
          <label for="radio2"><h5>2 - Poor</h5></label>
        </div>
        <div class="funkyradio-success">
          <input type="radio" name="radio" id="radio1" value="1" required/>
          <label for="radio1"><h5>1 - Bad</h5></label>
        </div>
      </div>

    <!--This input field contains the mouse tracking data and needs to be declared inside the submit form -->
    <input type="hidden" id="mouse_track" name="mouse_track" value=""/>

    <!--<div class="row"> -->
      <button type="submit" id="submitButton" class="btn-lg btn-success btn-block" style="margin-top: 2em;" onclick="log_position()" disabled>Submit and continue</button>
    <!-- </div> -->
  </form>
  <p>
    <button id="record"></button>
    <button id="stopRecord" disabled>Stop</button>
  </p>
</div>

<!-- this script enables the submit button after one option was checked -->
<script>
$(document).ready(function(){
    $(".funkyradio-success").click(function(){
        $("#submitButton").removeAttr("disabled");
    });
});
</script>

<!-- Logic behind speech recording -->
<script>
  /* Capture the audio stream from user's microphone */
  /* TODO Finish implementing the logic allowing to record speech */
  navigator.mediaDevices.getUserMedia({audio:true})
    .then(stream => {handlerFunction(stream)})

  function handlerFunction(stream) {
    rec = new MediaRecorder(stream);
    rec.ondataavailable = e => {
      audioChunks.push(e.data);
      if (rec.state == "inactive") {
        let blob = new Blob(audioChunks, {type: 'audio/mpeg-3'});
        recordedAudio.src = URL.createObjectURL(blob);
        recordedAudio.controls = true;
        recordedAudio.autoplay = true;
        sendData(blob)
      }
    }
  }

  document.getElementById("record").onclick = e => {
    console.log("I was clicked")
    document.getElementById("record").disabled = true;
    document.getElementById("record").style.backgroundcolor = "blue"
    document.getElementById("stopRecord").disabled = false;
    audioChunks = [];
    rec.start()
  }
</script>
