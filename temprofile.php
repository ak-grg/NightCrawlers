<?php
session_start();
/* 
    Akshit
    19BCE0795
    19-10-2021
*/
?>

<!DOCTYPE html>
<html>
<head>
	<title>Welcome to Nightcrawlers!</title>
	<link rel="stylesheet" type="text/css" href="assets/css/style.css">
    <style>
        .profilet {
            margin-left: 350px;
            margin-top: 100px;
            width: 59%;
            min-height: 60px;
            text-align: center;
            font-family: 'Bellota-BoldItalic', sans-serif;
        }
        .profile_info {
            background-color: #e5e2f4;
        }
        .profile_info p{
            color: #1f6988;
        }
        .profile_pic {
            min-width: 80px;
            width: 25%;
            margin: 20px;
            margin-left: 35px;
            border: 5px solid #ffffff;
            box-shadow: 0px 0px 15px -4px #888;
            border-radius: 200px;
        }
    </style>

</head>

<body>
    <div class="column profilet">
        
        <?php
        $myfile = fopen( $_SESSION['username'] . ".txt", "r") or die("Unable to open file!");
        echo "<img class='profile_pic' src='" . fgets($myfile) . "'>";
        echo "<h1>". fgets($myfile) ."</h1>";
        echo "
        <div class='profile_info'>
            <p>Email: ". fgets($myfile) ."</p>
            <p>Date added: ". fgets($myfile) ."</p>
            <p>Password (md5 encrypted): ". fgets($myfile) ."</p>
        </div>";
        fclose($myfile);
        ?>
        
        
    </div>
</body>