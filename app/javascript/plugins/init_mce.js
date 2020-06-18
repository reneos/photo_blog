const initMCE = () => {
  if(document.querySelector('.tinymce')){
    const uploadPath = document.querySelector('.edit_post').dataset.uploadPath;
    tinymce.remove();
    tinymce.init({
      selector: 'textarea',
      skin: 'shuttermushi',
      menubar: false,
      plugins: "image link table lists searchreplace visualblocks code fullscreen insertdatetime media paste help wordcount autolink imagetools emoticons",
      toolbar: [
        "undo redo | styleselect | bold italic backcolor | alignleft aligncenter alignright | bullist numlist outdent indent | image | link | table | code | help",
        "emoticons | insertdatetime"
      ],
      images_upload_handler: function(blobInfo, success, failure) {
        const formData = new FormData();
        const token = document.querySelector('meta[name="csrf-token"]').content;
        formData.append('file', blobInfo.blob(), blobInfo.filename());
        formData.append('authenticity_token', document.querySelector('input[name=authenticity_token]').value )
        fetch(uploadPath,{
           method: "POST",
          body: formData
        })
          .then(response => response.json())
          .then((data) => {
            success(data.location);
          })
          .catch(error => {
            console.log("Error uploading file")
          });
      }
    });
  }

}


export { initMCE };
