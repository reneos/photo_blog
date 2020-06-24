import Litepicker from 'litepicker';

const initLitepicker = () => {
  const dateField = document.querySelector('.litepicker')
  if(dateField) {
    new Litepicker({
      element: dateField,
    });
  }
}

export initLitepicker;
