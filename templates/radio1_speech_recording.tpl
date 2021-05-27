<!-- this template defines a radio button form.
When creating custom forms copy this basic structure.
Don't change the form attributes "action" and "method"-->

<div class="container">
  <!-- The wrapper taken from Mozilla's Web Dictaphone -->
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
  <form id="form1" onsubmit="submit_audio_rating(event)">

    <!--This input field contains the mouse tracking data and needs to be declared inside the submit form -->
    <input type="hidden" id="mouse_track" name="mouse_track" value=""/>
    <input type="hidden" id="audio_file_input" type="file" />
    <!--<div class="row"> -->
      <button type="submit" id="submitButton" class="btn-lg btn-success btn-block" style="margin-top: 2em;"
              disabled>Submit and continue</button>
    <!-- </div> -->
  </form>
</div>

<!-- Add the logic handling audio recording -->
<script src="/static/audio_recording.js"></script>

<!-- Logic for submiting audio rating -->
<script>
  const submit_audio_rating = (event) =>{
    event.preventDefault();
    const mouse_track = log_position();




    // Create formData with needed data
    const formData = new FormData();
    formData.append('audio_file', audio_recording_blob)
    formData.append('mouse_track', mouse_track)

    console.log(formData);

    const url = "/save_audio_rating?video_index={{video_index}}";

    // Post data to the server - only audio recording for now
    fetch(url, {
      method: "POST",
      body: formData
    })
  }

</script>
