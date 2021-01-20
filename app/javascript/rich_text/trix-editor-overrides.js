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
    alert("Only support attachment files upto size 1MB!")
  }
})

