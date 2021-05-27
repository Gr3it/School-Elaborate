<?php
    $servername = "localhost";
    $userDB = "root";
    $passDB = "";
    $dbname = "hotel";

    $conn = new mysqli($servername, $userDB, $passDB, $dbname);
  
    if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
    }
