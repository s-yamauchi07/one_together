window.addEventListener('load', () => {
  console.log('読み込まれた')
  const registrationCard = document.getElementById('registration-card')

  if (!registrationCard) return null;
  const registrationImage = document.getElementById('registration-dog-image')

  const registrationImageField = document.getElementById('user_dog_image')
  registrationImageField.addEventListener('change',(e)=> {

    const preReview = document.querySelector('.preview-image')
    if (preReview) {
      preReview.remove();
    }

    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file)

    registrationImage.removeAttribute('class','fa-image')
    
    const previewImage = document.createElement('img')
    previewImage.setAttribute('src',blob)
    previewImage.setAttribute('class','preview-image')
    previewImage.setAttribute('style','width: 300px;')
    registrationImage.appendChild(previewImage)

  })

})