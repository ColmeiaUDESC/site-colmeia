let githubApi = async () => {
  const githubContainer = document.getElementById('githubContainer');

  fetch('https://api.github.com/repos/ColmeiaUDESC/site-colmeia/contributors')
    .then(response => response.json())
    .then(data => {
      data.reverse().forEach(membro => {
        githubContainer.innerHTML += `
        <a href="${membro.html_url}" target="_blank">
          <img class="inline-block h-8 w-8 rounded-full ring-2 ring-white" src="${membro.avatar_url}">
        </a>
        `
      });
    });
}

document.addEventListener("turbolinks:load", async () => {
  await githubApi();
})  