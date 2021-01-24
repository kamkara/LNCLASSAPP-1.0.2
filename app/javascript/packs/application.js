// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
//= require jquery

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
 const images = require.context('../images', true)
 const imagePath = (name) => images(name, true)

import "../css/application.css"

// FONT AWESOME
import "@fortawesome/fontawesome-free/js/all";

// RICH_TEXT
require("trix")
require("@rails/actiontext")
// app/javascript/trix-editor-overrides.js

document.addEventListener('turbolinks:load', () => {
   

    //rich text editor
    document.addEventListener('click', () => {
        let element = event.target.closest('.text-content')
        if (!element) return;

        element.classList.add('d-none')
        element.nextElementSibling.classList.remove('d-none')
    })

    document.addEventListener('click', () => {
        if (!event.target.matches('.cancel')) return;

        event.preventDefault();

        let element = event.target.closest('.form-content')

        element.classList.add('d-none')
        element.previousElementSibling.classList.remove('d-none')
    })
})


window.addEventListener("trix-file-accept", function(event) {
  const acceptedTypes = ['image/jpeg', 'image/png']
  if (!acceptedTypes.includes(event.file.type)) {
    event.preventDefault()
    alert("Les images autorisée, sont les .png .Jpeg")
  }

  //
  const maxFileSize = 1024 * 1024 // 1MB 
  if (event.file.size > maxFileSize) {
    event.preventDefault()
    alert("La taille du support autorisé est de 1MB!")
  }
})


//RICH TEXT
import "../rich_text/trix-editor-overrides"
//ANALYTICS
import "../analytics/google_analytics"
//VALIDATES FORM SIGN UP ANS SIGN IN
import "../validates/formValidates"