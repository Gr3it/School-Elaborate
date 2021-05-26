document.querySelector(".avanti1").addEventListener("click", function () {
  var element = document.querySelector(".formh1");
  element.classList.add("deactive");
  var element = document.querySelector(".formh2");
  element.classList.remove("deactive");
  var element = document.querySelector(".formb1");
  element.classList.add("deactive");
  var element = document.querySelector(".formb2");
  element.classList.remove("deactive");
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
