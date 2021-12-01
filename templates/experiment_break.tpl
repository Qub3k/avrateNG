<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Max" >
    <title>{{title}}</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@600&display=swap" rel="stylesheet">

    <style>
        body{
            background-color: whitesmoke;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            font-family: 'Raleway', sans-serif;
            color: #222222;
            height: 100vh;
            overflow: hidden;
        }
        .container{
            user-select: none;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background-color: #BAE0FF;
            padding: 3em;
            border-radius: 10px;
            min-height: 250px;
        }
        h1{
            margin: 0
        }
        h3{
            margin-bottom: 50px
        }
        button{
            border-radius: 5px;
            border: none;
            outline: none;
            padding: 1em 2em;
            font-family: 'Raleway', sans-serif;
            font-size: 18px;
            background-color: #222222;
            color: white;
            width: 100%;
            cursor: pointer;
            animation: fadein 1.5s ease-in;
        }
        @keyframes fadein {
            0%{
                opacity: 0%;
            },
            100%{
                opacity: 100%;
            }
        }
        button:hover{
            background-color: #28a745;
        }
        #counter{
            animation: fadein 4s ease-in;
            font-family: 'Raleway', sans-serif;
            font-size: 32px;
        }

    </style>
</head>


<body>
    <div class="container">
        <h1> Experiment Break </h1>
        <h3> Please take your time and press button below when ready.</h3>
        <form action="/rate/{{video_index}}" style="width: 100%; height: 50px; display: flex; align-items: center; justify-content: center;">
            <button id="continue-btn" type="submit" style="display: none"> Continue </button>
            <span id="counter"></span>
        </form>
    </div>
</body>

<script>
    let counter = parseInt({{break_duration_sec}})
    console.log(counter)


    start()

    function start(){
        document.getElementById("counter").innerText = counterFormat(counter)

        setInterval(() => {
            console.log(counter)
            if(counter >= 2){
                counter -= 1
                document.getElementById("counter").innerText = counterFormat(counter)
            }
            else if(counter === 1){
                document.getElementById("continue-btn").style.display = "unset"
                document.getElementById("counter").style.display = "none"
            }
        }, 1000)
    }

    function counterFormat(value){
        const minutes = Math.floor(value/(60))
        const seconds = value%(60)

        const seconds_str = seconds > 9 ? seconds : `0${seconds}`

        return `${minutes} : ${seconds_str}`
    }


</script>
</html>
