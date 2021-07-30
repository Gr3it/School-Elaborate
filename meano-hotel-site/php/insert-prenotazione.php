<?php
include "./connection.php";

$inizio = $_POST['inizio'];
$fine = $_POST['fine'];
$stanze = json_decode($_POST['stanze']);
$nome = $_POST['nome'];
$cognome = $_POST['cognome'];
$codice_fiscale = $_POST['codice_fiscale'];
$email = $_POST['email'];
$data_di_nascita = $_POST['data_di_nascita'];

$query = "select Codice_Fiscale from cliente where Codice_Fiscale=?";

$stmt = $conn->prepare($query);

file_put_contents("./debug.txt",print_r($stmt,true));
file_put_contents("./debug.txt",$stmt,FILE_APPEND);

$stmt->bind_param("s", $codice_fiscale);
$stmt->execute();
$result = $stmt->get_result();

$stmt->close();

if ($result->num_rows > 0) {

}
else {
  $query = "INSERT INTO cliente(Codice_Fiscale, Nome, Cognome, Email, Data_Di_Nascita) VALUES (?,?,?,?,?); ";

  $stmt = $conn->prepare($query);

  $stmt->bind_param("sssss", $codice_fiscale, $nome, $cognome, $email, $data_di_nascita);
  $stmt->execute();

  $stmt->close();
}

$query = "INSERT INTO prenotazione(Codice_Fiscale_Cliente, Data_Inizio_Prenotazione, Data_Fine_Prenotazione, Pagamento_Caparra) VALUES (?,?,?,?); ";
$var = 0;
$stmt = $conn->prepare($query);

$stmt->bind_param("sssi", $codice_fiscale, $inizio, $fine, $var);
$stmt->execute();

$stmt->close();

$last_insert = $conn->insert_id;

foreach($stanze as $stanza){
  $query = "INSERT INTO prenotazione_comprende_camera(Nome_Camera, Id_Prenotazione) VALUES (?,?);";
  $stmt = $conn->prepare($query);
  $stmt->bind_param("si", $stanza, $last_insert);
  $stmt->execute();

  $stmt->close();
}

$conn->close();