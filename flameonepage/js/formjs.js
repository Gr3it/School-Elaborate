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
  var element = document.querySelector(".formh3");
  element.classList.add("deactive");
  var element = document.querySelector(".formh4");
  element.classList.remove("deactive");
  var element = document.querySelector(".formb3");
  element.classList.add("deactive");
  var element = document.querySelector(".formb4");
  element.classList.remove("deactive");

  camera = document.querySelectorAll(".selected");
  costo = 0;

  element = document.querySelector(".recipe-container");
  element.innerHTML =
    "<tr><th>Spesa</th><th>Numero Persone</th><th>Totale</th></tr>";

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
        element = document.querySelector(".recipe-container");
        costo_camera = data[0]["Costo_A_Notte"] * data[0]["Numero_Posti"];
        element.innerHTML +=
          "<tr><td>" +
          element_name +
          "</td><td>" +
          data[0]["Numero_Posti"] +
          "</td><td>" +
          costo_camera.toFixed(2) +
          "</td></tr>";
        costo += costo_camera;
      },
    });
  });

  $(document).ajaxComplete(function () {
    console.log(costo);
  });
});

document.querySelector(".indietro4").addEventListener("click", function () {
  var element = document.querySelector(".formh3");
  element.classList.remove("deactive");
  var element = document.querySelector(".formh4");
  element.classList.add("deactive");
  var element = document.querySelector(".formb3");
  element.classList.remove("deactive");
  var element = document.querySelector(".formb4");
  element.classList.add("deactive");
});

function clicked(room) {
  var element = document.querySelector("." + room);
  if (!element.classList.contains("occupied"))
    element.classList.toggle("selected");
}
