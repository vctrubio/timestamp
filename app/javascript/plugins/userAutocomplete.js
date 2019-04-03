export const autocomplete = () => {
  const inputText = document.getElementById('query');
  const results = document.getElementById('api-results');

  if (inputText) {
    inputText.addEventListener('input', (event) => {
      if (inputText.value[0] === "@") {
        fetch(`/api/v1/users?query=${inputText.value}`)
        .then(response => response.json())
        .then((data) => {
          results.innerHTML = "";
          console.log(data);
          data.forEach((user) => {
            const suggestedUserLi = `<a href="${user.link}"><li class="list-group-item"><img class="avatar-comment" src="${user.profile_photo.url}"/><p>${user.username}</p></li></a>`;
            results.insertAdjacentHTML("beforeend", suggestedUserLi);
          });
        });
      } else {
        fetch(`/api/v1/events?query=${inputText.value}`)
        .then(response => response.json())
        .then((data) => {
          results.innerHTML = "";
          console.log(data);
          data.forEach((event, index) => {
            const suggestedEventLi = `<a href="/events?utf8=✓&query=${event.title}"><li class="list-group-item" id='list-group-item-${index}'><p>${event.title}</p></li></a>`;
            results.insertAdjacentHTML("beforeend", suggestedEventLi);

            // const listItem = document.getElementById(`list-group-item-${index}`)
            // listItem.addEventListener('click', (event) => {
            //   const searchResult = event.currentTarget.innerText
            //   inputText.value = searchResult
            // });
          });
        });
      }
    });
  }
}

