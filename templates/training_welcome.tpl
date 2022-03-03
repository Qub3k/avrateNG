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
      <h1>Welcome to AVRateNG </h1>
      <p class="lead">This is the training stage</p>
      <div style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
        <p class="lead" id="user_id" style="margin: 0; padding: 0">User ID: </p>
        <input type="text" id="user_id_input" oninput="updateUserID()" style="border: 1px solid #222222; border-radius: 5px; padding-left: 10px; padding-right: 10px;"/>
      </div>
      <br><br>
      <a class="btn btn-large btn-success" href="/rate/0" id="start">Start training</a> <!-- Jump to first trainingsplaylist item -->

    </div>
    <div class="container" id="footer" >
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
    console.log(document.cookie)
    const user_id = getCookie("user_id")
    document.getElementById("user_id_input").value = user_id
  }

  function updateUserID(){
    const value = document.getElementById("user_id_input").value
    setCookie("user_id", value)
    console.log(document.cookie)
  }


  function getCookie(name) {
    const value = `; ${document.cookie}`;
    const parts = value.split(`; ${name}=`);
    if (parts.length === 2) return parts.pop().split(';').shift();
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
