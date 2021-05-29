document.querySelector(".avanti1").addEventListener("click", function () {
  var element = document.querySelector(".formh1");
  element.classList.add("deactive");
  var element = document.querySelector(".formh2");
  element.classList.remove("deactive");
  var element = document.querySelector(".formb1");
  element.classList.add("deactive");
  var element = document.querySelector(".formb2");
  element.classList.remove("deactive");

  inizio = document.getElementById("arrivo").value;
  fine = document.getElementById("partenza").value;

  $.ajax({
    url: "./php/select-stanze-occupate.php",
    type: "POST",
    data: {
      inizio: inizio,
      fine: fine,
    },
    success: function (data) {
      JSON.parse(data).forEach((element) => {
        var element = document.querySelector("." + element);
        element.classList.add("occupied");
      });
    },
  });
});

document.querySelector(".indietro2").addEventListener("click", function () {
  var element = document.querySelector(".formh1");
  element.classList.remove("deactive");
  var element = document.querySelector(".formh2");
  element.classList.add("deactive");
  var element = document.querySelector(".formb1");
  element.classList.remove("deactive");
  var element = document.querySelector(".formb2");
  element.classList.add("deactive");
});

document.querySelector(".avanti2").addEventListener("click", function () {
  var element = document.querySelector(".formh2");
  element.classList.add("deactive");
  var element = document.querySelector(".formh3");
  element.classList.remove("deactive");
  var element = document.querySelector(".formb2");
  element.classList.add("deactive");
  var element = document.querySelector(".formb3");
  element.classList.remove("deactive");
});

document.querySelector(".indietro3").addEventListener("click", function () {
  var element = document.querySelector(".formh2");
  element.classList.remove("deactive");
  var element = document.querySelector(".formh3");
  element.classList.add("deactive");
  var element = document.querySelector(".formb2");
  element.classList.remove("deactive");
  var element = document.querySelector(".formb3");
  element.classList.add("deactive");
});

document.querySelector(".avanti3").addEventListener("click", function () {
  var lunghezza = 999;
  var element = document.querySelector(".formh3");
  element.classList.add("deactive");
  var element = document.querySelector(".formh4");
  element.classList.remove("deactive");
  var element = document.querySelector(".formb3");
  element.classList.add("deactive");
  var element = document.querySelector(".formb4");
  element.classList.remove("deactive");

  let firstDate = $("#arrivo").val();
  let secondDate = $("#partenza").val();
  const findTheDifferenceBetweenTwoDates = (firstDate, secondDate) => {
    firstDate = new Date(firstDate);
    secondDate = new Date(secondDate);

    let timeDifference = Math.abs(secondDate.getTime() - firstDate.getTime());

    let millisecondsInADay = 1000 * 3600 * 24;

    let differenceOfDays = Math.ceil(timeDifference / millisecondsInADay);

    return differenceOfDays;
  };
  camera = document.querySelectorAll(".selected");
  lunghezza = document.querySelectorAll(".selected").length;

  costo = 0;
  persone = 0;
  giorni = findTheDifferenceBetweenTwoDates(firstDate, secondDate);

  element = document.querySelector(".table");
  element.innerHTML =
    "<tr><th>Spesa</th><th>Numero Persone</th><th>Costo singolo giornaliero</th><th>Costo Totale</th></tr>";

  camera.forEach((element) => {
    const element_name = element.classList[1];
    $.ajax({
      url: "./php/select-costo.php",
      type: "POST",
      data: {
        camera: element.classList[1],
      },

      success: function (data) {
        data = JSON.parse(data);
        element = document.querySelector(".table");
        costo_camera =
          data[0]["Costo_A_Notte"] * data[0]["Numero_Posti"] * giorni;
        persone += data[0]["Numero_Posti"];
        costo += costo_camera;

        element.innerHTML +=
          "<tr><td>" +
          [
            element_name[0].toUpperCase(),
            element_name.slice(1, 5),
            " n°",
            element_name.slice(5),
          ].join("") +
          "</td><td>" +
          data[0]["Numero_Posti"] +
          "</td><td><span>€ </span>" +
          data[0]["Costo_A_Notte"] +
          "</td><td><span>€ </span>" +
          costo_camera +
          "</td></tr>";

        if (lunghezza == 1) {
          element = document.querySelector(".table");
          element.innerHTML +=
            "<tr id='total-row'><td><b>Totale</b></td><td></td><td></td><td><span>€ </span>" +
            costo +
            "</td></tr>";
          costo_caparra = costo + persone * 1.5 * giorni;
          element.innerHTML +=
            "<tr><td>Tassa di soggiorno</td><td>" +
            persone +
            "</td><td><span>€ </span>" +
            1.5 +
            "</td><td><span>€ </span>" +
            persone * 1.5 * giorni +
            "</td></tr>";
          element.innerHTML +=
            "<tr id='total-row'><td><b>Totale con tassa di soggiorno</b></td><td></td><td></td><td><span>€ </span>" +
            costo_caparra +
            "</td></tr>";
        }
        lunghezza--;
      },
    });
  });
});

document.querySelector(".indietro4").addEventListener("click", function () {
  var element = document.querySelector(".table");
  element.innerHTML = "";

  var element = document.querySelector(".formh3");
  element.classList.remove("deactive");
  var element = document.querySelector(".formh4");
  element.classList.add("deactive");
  var element = document.querySelector(".formb3");
  element.classList.remove("deactive");
  var element = document.querySelector(".formb4");
  element.classList.add("deactive");
});

document.querySelector(".avanti4").addEventListener("click", function () {
  var element = document.querySelector(".formh4");
  element.classList.add("deactive");
  var element = document.querySelector(".confirmation");
  element.classList.remove("deactive");
  var element = document.querySelector(".formb4");
  element.classList.add("deactive");
  var element = document.querySelector(".confirmation");
  element.classList.remove("deactive");

  i = 0;
  camere = [];
  stanze = document.querySelectorAll(".selected");
  stanze.forEach((element) => {
    camere[i++] = element.classList[1];
  });

  camere = JSON.stringify(camere);

  inizio = document.getElementById("arrivo").value;
  fine = document.getElementById("partenza").value;
  nome = document.getElementById("nome").value;
  cognome = document.getElementById("cognome").value;
  codice_fiscale = document.getElementById("codice_fiscale").value;
  email = document.getElementById("email").value;
  data_di_nascita = document.getElementById("data_di_nascita").value;

  console.log(camere);

  $.ajax({
    url: "./php/insert-prenotazione.php",
    type: "POST",
    data: {
      inizio: inizio,
      fine: fine,
      stanze: camere,
      nome: nome,
      cognome: cognome,
      codice_fiscale: codice_fiscale,
      email: email,
      data_di_nascita,
    },
    success: function (data) {
      console.log(data);
    },
  });

  element = document.querySelector(".confirmation");
  element.innerHTML =
    "<h1>Prenotazione Confermata</h1></br><h3>Si prega di effettuare il versamento di <span>€</span> " +
    (costo * 30) / 100 +
    " sul seguente iban a titolo di caparra per validare la prenotazione<br>iban: IT18K0364601600526584178430<br>Con causale nome, cognome dell'intestato alla prenotazione</h3>";
});

function clicked(room) {
  var element = document.querySelector("." + room);
  if (!element.classList.contains("occupied"))
    element.classList.toggle("selected");
}
