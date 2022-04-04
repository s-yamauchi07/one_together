function registrationSpot () {
  const registration_btn = document.getElementById('registration')
  const modal = document.getElementById('registration-form')

  registration_btn.addEventListener('click', modalOpen);
    function modalOpen() {
    modal.style.display = 'block';
  };
}

window.addEventListener('load', registrationSpot)