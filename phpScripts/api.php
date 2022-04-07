<?php
					
$dbhost = "cs.okstate.edu";
$dbuser = "aasosa";
$dbpass = "ba)Hair25";
$db = "aasosa";

try{
    $conn = new PDO("mysql:host=$dbhost;dbname=$dbuser", $dbuser, $dbpass);

    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);  // To turn on error mode for debugging errors
	$conn->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);  // To get maximum sql injection protection
   echo "Connected successfully</br>";
} 
catch(PDOException $e){
    echo "Connection failed: " . $e->getMessage();
}

index();

function index()
{
	global $conn;

	$query = $conn->query("SELECT name , nickname FROM states");
	$result = $query->fetchAll();
	echo "<b>Total States </b> ( Total No of Results : ".$query->rowCount()." )</br>";
	foreach($result as $object)
	{
		echo "</br>name: ".$object['name']."</br>nickname : ".$object['nickname'];	 
	}
}

?>