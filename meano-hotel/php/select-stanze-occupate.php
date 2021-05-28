<?php
    include "./connection.php";

    $inizio = $_POST['inizio'];
    $fine = $_POST['fine'];

    $query = "select DISTINCT camera.Nome_Camera from camera, prenotazione_comprende_camera, prenotazione where camera.Nome_Camera = prenotazione_comprende_camera.Nome_Camera and prenotazione_comprende_camera.Id_Prenotazione = prenotazione.Id_Prenotazione and ((prenotazione.Data_Inizio_Prenotazione >= ? and prenotazione.Data_Fine_Prenotazione <= ?) OR (prenotazione.Data_Inizio_Prenotazione <= ? and prenotazione.Data_Fine_Prenotazione >= ?) OR
    (prenotazione.Data_Inizio_Prenotazione <= ? and prenotazione.Data_Fine_Prenotazione >= ?))";

    $stmt = $conn->prepare($query);

    $stmt->bind_param("ssssss", $inizio, $fine, $inizio, $inizio, $fine, $fine);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $data=[];
        $i=0;
        while ($row = $result->fetch_assoc()) {         
            $data[$i]=$row["Nome_Camera"];
            $i++;
        }
        echo json_encode($data);
    }


    $stmt->close();
    $conn->close();