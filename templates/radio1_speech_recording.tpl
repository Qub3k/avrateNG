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
  <!-- The first simplistic audio recording interface -->
  <!-- TODO 1. Remove the elements related to the first simplistic solution -->
  <!-- TODO 2. Redesign the response screen -->
  <p>
    <button id="record"></button>
    <button id="stopRecord" disabled>Stop</button>
  </p>
  <p>
    <audio id="recordedAudio"></audio>
  </p>
  <!-- The new approach (based on Mozilla's Web Dictaphone) -->
  <div class="wrapper">
    <section class="main-controls">
      <canvas class="visualizer" height="60px"></canvas>
      <div id="recordingButtons">
        <button class="record">Record</button>
        <button class="stop">Stop</button>
      </div>
    </section>

    <section class="sound-clips">
      <!-- Here is where the recorded audio clips end up -->
    </section>
  </div>
</div>

<!-- Add the logic handling audio recording -->
<script src="/static/audio_recording.js"></script>

<!-- this script enables the submit button after one option was checked -->
<script>
$(document).ready(function(){
    $(".funkyradio-success").click(function(){
        $("#submitButton").removeAttr("disabled");
    });
});
</script>
