const searchIcon = document.querySelector(`#top-loginSet__iconSet i`);
const searchInput = document.querySelector(`#search`);
const CLASSNAME_HIDDEN = "hidden";

function popUpSearch() {
  searchInput.classList.toggle(CLASSNAME_HIDDEN);
}

searchIcon.addEventListener("click", popUpSearch);
