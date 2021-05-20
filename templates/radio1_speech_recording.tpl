<!-- this template defines a radio button form.
When creating custom forms copy this basic structure.
Don't change the form attributes "action" and "method"-->

<div class="container">
  <!-- TODO 1. Redesign the response screen -->
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
  <form id="form1" action="/save_rating?video_index={{video_index}}" method="post">

    <!--This input field contains the mouse tracking data and needs to be declared inside the submit form -->
    <input type="hidden" id="mouse_track" name="mouse_track" value=""/>

    <!--<div class="row"> -->
      <button type="submit" id="submitButton" class="btn-lg btn-success btn-block" style="margin-top: 2em;" onclick="log_position()" disabled>Submit and continue</button>
    <!-- </div> -->
  </form>
</div>

<!-- Add the logic handling audio recording -->
<script src="/static/audio_recording.js"></script>

<!-- this script enables the submit button after one option was checked -->
<!-- TODO 1.1 Change this to unlock the submit button once a speech sample has been recorded -->
<script>
$(document).ready(function(){
    $(".funkyradio-success").click(function(){
        $("#submitButton").removeAttr("disabled");
    });
});
</script>
