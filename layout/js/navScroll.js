window.onscroll = function () {
  navScroll();
};

const nav = document.querySelector(`.nav`);

function navScroll() {
  if (document.documentElement.scrollTop > 100) {
    nav.style.animation = "fadeIn 1s";
    nav.style.position = "fixed";
    nav.style.zIndex = "10";
    nav.style.top = "0";
  } else {
    nav.style.animation = "";
    nav.style.position = "";
  }
}
