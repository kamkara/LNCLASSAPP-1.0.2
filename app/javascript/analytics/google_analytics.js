
document.addEventListener('turbolinks:load', () => {
    // google analytics load
    document.addEventListener('turbolinks:load', function(event) {
        if (typeof gtag === 'function') {
            // define GA ID on credentials
            gtag('config', '<%= Rails.application.credentials.dig(:google_analytics) %>', {
            'page_location': event.data.url
            })
        }
    })
})