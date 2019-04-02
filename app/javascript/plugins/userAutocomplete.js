export const autocomplete = () => {
  const inputText = document.getElementById('query');
  const results = document.getElementById('api-results');

  if (inputText) {
    inputText.addEventListener('input', (event) => {
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
  });
  }

}

