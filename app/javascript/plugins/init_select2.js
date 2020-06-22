import select2 from "select2";

const initSelect2 = () => {
  $('.select2').select2({
    tags: true,
  });
}

export { initSelect2 }
