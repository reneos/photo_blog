import Chocolat from 'chocolat';

const initLightbox = () => {
  if (document.querySelector('.polaroid-link')){
    const chocolate = Chocolat(document.querySelectorAll('.polaroid-link'), {
      container: document.querySelector('body'),
      loop: true,
      imageSize: 'contain'
    });
  }
}

export { initLightbox };
