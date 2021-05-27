<?php
    include "./connection.php";

    $camera = $_POST['camera'];

    $query = "select Costo_A_Notte, Numero_Posti from camera where Nome_Camera = ? ";

    $stmt = $conn->prepare($query);

    $stmt->bind_param("s", $camera);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $data=[];
        $i=0;
        while ($row = $result->fetch_assoc()) {         
            $data[$i]=$row;
            $i++;
        }
        echo json_encode($data);
    }


    $stmt->close();
    $conn->close();