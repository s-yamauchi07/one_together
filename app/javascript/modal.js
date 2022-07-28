window.addEventListener('load', () => {
  const overLay = document.getElementById('overlay');
  const modal = document.getElementById('modal-window');
  const withdrawBtn = document.querySelector('.button-open');
  const closeBtn = document.querySelector('.button-close');

  withdrawBtn.addEventListener('click', () => {
    modal.style.display = "block";
    overLay.style.display = "block";
  })

  closeBtn.addEventListener('click', () => {
    modal.style.display = "none";
    overLay.style.display = "none";
  })
})