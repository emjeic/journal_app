// app/assets/javascripts/application.js
document.addEventListener('DOMContentLoaded', function() {
    var openFormBtn = document.getElementById('open-form-btn');
    var popupForm = document.getElementById('popup-form');
  
    openFormBtn.addEventListener('click', function() {
      popupForm.style.display = 'block';
    });
  });
  