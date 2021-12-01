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
        }
        button:hover{
            background-color: #28a745;
        }

    </style>
</head>


<body>
    <div class="container">
        <h1> Experiment Break </h1>
        <h3> Please take your time and press button below when ready.</h3>
        <form action="/rate/{{video_index}}" style="width: 100%">
            <button type="submit"> Continue </button>
        </form>
    </div>
</body>

</html>
