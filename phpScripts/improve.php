<?php
 
    $conn = mysqli_connect("cs.okstate.edu", "aasosa", "aasosa", "ba)Hair25");
 
    // get data from database
    $result = mysqli_query($conn, "SELECT * FROM states");
 
    // adding in array
    $data = array();
    while ($row = mysqli_fetch_object($result))
    {
        $i = $i++;
        echo $row;
        echo $i;
        array_push($data, $row);
    }
 
    // send as response
    echo $data[0] , $data[1];
    echo json_encode($data);
 
?>