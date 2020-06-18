import Chocolat from 'chocolat';
import 'chocolat/dist/css/chocolat.css';

const initLightbox = () => {
  Chocolat(document.querySelectorAll('.polaroid-link'), {
    loop: true,
    imageSize: 'contain'
  });
}

export { initLightbox };
