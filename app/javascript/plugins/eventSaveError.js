 const eventSaveError = () => {
  const addEventButton = document.getElementById('make-event');
  const titleInput = document.getElementById('event_title');
  addEventButton.addEventListener('click', (event) => {

    if (titleInput.value === "") {
      // Prevent default send of form if value is empty
      event.preventDefault();
      // Append innerHTMl to form div to show "title can-t be blank"
      document.querySelector("#error").innerText = "Title cannot be blank"
      // else send form
    }
  })
};

eventSaveError();
