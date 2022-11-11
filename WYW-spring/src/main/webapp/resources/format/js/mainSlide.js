const mainSlide = document.querySelector(`.main__slide`);
const leftSlide = document.querySelector(`.main__slide-left`);
const rightSlide = document.querySelector(`.main__slide-right`);
const bgImg = document.createElement("img");
let idx = 1;
bgImg.src = `img/slide/slide_${idx}.png`;
mainSlide.appendChild(bgImg);
function slideLeftImg() {
  bgImg.style.opacity = "0";
  idx = idx - 1;
  if (idx < 1) {
    idx = 4;
  }
  setTimeout(() => {
    bgImg.style.opacity = "1";
    bgImg.src = `img/slide/slide_${idx}.png`;
  }, 500);
}
function slideRightImg() {
  bgImg.style.opacity = "0";
  idx = idx + 1;
  if (idx > 4) {
    idx = 1;
  }
  setTimeout(() => {
    bgImg.style.opacity = "1";
    bgImg.src = `img/slide/slide_${idx}.png`;
  }, 500);
}

leftSlide.addEventListener(`click`, slideLeftImg);
rightSlide.addEventListener(`click`, slideRightImg);
setInterval(slideRightImg, 10000);
