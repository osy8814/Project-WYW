ClassicEditor
    .create(document.querySelector('#description'),{
        language:'ko',
        toolbar: {
            items : ['bold', 'italic', 'link', 'insertTable', 'undo'],
            shouldNotGroupWhenFull: true
        }
    })
    .catch(error=>{
        console.error(error);
    });