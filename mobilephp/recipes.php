<?php
header('Content-Type: application/json');


$conn = new mysqli("sql102.infinityfree.com", "if0_38027600", "wscHjWJFNiG4Z", "if0_38027600_ahmad");


if ($conn->connect_error) {
    die(json_encode(["error" => "Connection failed: " . $conn->connect_error]));
}


$sql = "SELECT * FROM recipes";
$result = $conn->query($sql);

$recipes = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $recipes[] = $row; 
    }
    echo json_encode($recipes); 
} else {
    echo json_encode(["message" => "No recipes found"]);
}


$conn->close();
?>
