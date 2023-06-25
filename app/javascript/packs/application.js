// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "@fortawesome/fontawesome-free/css/all.css";

Rails.start();
ActiveStorage.start();

// Hide notice and alert elements if they do not contain text content
document.addEventListener("DOMContentLoaded", () => {
  let notice = document.getElementsByClassName("notice")[0];
  let alert = document.getElementsByClassName("alert")[0];

  notice.textContent === ""
    ? (notice.style.display = "none")
    : (notice.style.display = "block");

  alert.textContent === ""
    ? (alert.style.display = "none")
    : (alert.style.display = "block");
});

// Hide flash messages after 3 seconds
let generalInterval = setInterval(() => {
  let notice = document.getElementsByClassName("notice")[0];
  let alert = document.getElementsByClassName("alert")[0];

  if (notice) {
    setTimeout(() => {
      notice.style.display = "none";
    }, 3000);
  }

  if (alert) {
    setTimeout(() => {
      alert.style.display = "none";
    }, 3000);
  }
}, 1000);

// clearInterval(generalInterval);
