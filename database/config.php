<?php
// Database connection configuration
$host = 'localhost';  
$port = 3307;          
$user = 'root';
$pass = 'mariadb';     
$dbname = 'maktaba';  

// Create connection
$conn = new mysqli($host, $user, $pass, $dbname, $port);

// Check connection
if ($conn->connect_error) {
    die("Database connection failed: " . $conn->connect_error);
}
?>
