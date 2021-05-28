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
  $query = "";
  $types = "";
}
else {
  $query = "INSERT INTO cliente(Codice_Fiscale, Nome, Cognome, Email, Data_Di_Nascita) VALUES (?,?,?,?,?); ";
  $types = "sssss";
  $params[] = $codice_fiscale;
  $params[] = $nome;
  $params[] = $cognome;
  $params[] = $email;
  $params[] = $data_di_nascita;
}

$query = $query."INSERT INTO prenotazione(Codice_Fiscale_Cliente, Data_Inizio_Prenotazione, Data_Fine_Prenotazione, Pagamento_Caparra) VALUES (?,?,?,?); ";
$types = $types."sssi";
$params[] = $codice_fiscale;
$params[] = $inizio;
$params[] = $fine;
$params[] = 0;

foreach($stanze as $stanza){
  $query = $query."INSERT INTO prenotazione_comprende_camera(Nome_Camera, Id_Prenotazione) VALUES (?,LAST_INSERT_ID);";
  $types = $types."s";
  $params[] = $stanza;
}

$stmt = $conn->prepare($query);

/* file_put_contents("./debug.txt",$query.print_r($params,true)); */
file_put_contents("./debug.txt",print_r($stmt,true),FILE_APPEND);
file_put_contents("./debug.txt",$stmt,FILE_APPEND);

/* $stmt->bind_param($types, ...$params);
$stmt->execute();
$result = $stmt->get_result();

$stmt->close(); */
$conn->close();