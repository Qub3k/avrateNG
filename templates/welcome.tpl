<!DOCTYPE html>
<html>
  <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="author" content="Max" >
    <title>{{title}}</title>
    % include('templates/header.tpl')
  </head>

  <body>
    <div id="playback"></div>
    <div class="jumbotron" id="jumbotron">
      <h1>Welcome to AVRateNG</h1>
      <p class="lead">You will now be asked for your rating, alright?</p>
      <!-- if you don't want to have the demographics survey, just replace href="/info" with href="/rate/0"
      -->
      <p class="lead" id="user_id">User ID: </p>
      <input type="text" id="user_id_input" oninput="updateUserID()" style="display: none; border: 1px solid #222222; border-radius: 5px; padding-left: 10px; padding-right: 10px;"/>
      <br><br>
      <a class="btn btn-large btn-success" href="/info" id="start">Get started</a> <!-- Jump to first playlist item -->
      <br><br>

    </div>
    <div class="container" id="footer">
      % include('templates/footer.tpl')
    </div>

  </body>

  <script>
  // this script is reponsible for engaging the wait screen during playback
  $(document).ready(function(){
      $("#start").click(function(){
          $("#playback").show();
          $("#jumbotron").hide();
          $("#footer").hide();
      });
    initUserID()
  });

  function initUserID(){
    const training_enabled = getCookie("training_enabled");
    if(training_enabled === "false"){
      const user_id = getCookie("user_id")
      const id_input = document.getElementById("user_id_input");
      id_input.style.display = "inline";
      id_input.value = user_id;
    }
    else{
      const user_id = getCookie("user_id")
      document.getElementById("user_id").innerText = "User ID: " + user_id
      document.getElementById("user_id_input").style.display = "none"
    }

  }

  function getCookie(name) {
    const value = `; ${document.cookie}`;
    const parts = value.split(`; ${name}=`);
    if (parts.length === 2) return parts.pop().split(';').shift();
  }

  function updateUserID(){
    const value = document.getElementById("user_id_input").value
    setCookie("user_id", value)
    console.log(document.cookie)
  }

  function setCookie(name,value,days) {
    let expires = "";
    if (days) {
      const date = new Date();
      date.setTime(date.getTime() + (days*24*60*60*1000));
      expires = "; expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + (value || "")  + expires + "; path=/";
  }

  </script>

</html>
