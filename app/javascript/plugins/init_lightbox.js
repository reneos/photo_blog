import Chocolat from 'chocolat';

const initLightbox = () => {
  Chocolat(document.querySelectorAll('.polaroid-link'), {
    loop: true,
    imageSize: 'contain'
  });
}

export { initLightbox };
