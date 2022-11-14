const allChkBox = document.querySelector(`#selectAll`);
const termsChkBoxs = document.querySelectorAll(".chkbox");
const agree1 = document.querySelector("#terms1");
const agree2 = document.querySelector("#terms2");
const agree3 = document.querySelector("#terms3");
const signupBtn = document.querySelector(".registerSubmit");


// 전체동의
function allchk() {
  // 전체동의 체크
  if (allChkBox.checked) {
    for (let i = 0; i < termsChkBoxs.length; i++) {
      termsChkBoxs[i].checked = true;
      // 하위동의목록 체크
    }
  } else {
    for (let i = 0; i < termsChkBoxs.length; i++) {
      termsChkBoxs[i].checked = false;
    }
  }
  // reqChk();
};

//천체 동의체크박스가 'Change'될 때 이벤트;
allChkBox?.addEventListener("change", allchk);

//하위 동의체크박스 중 하나가 'Change'될 때 이벤트
for (let i = 0; i < termsChkBoxs.length; i++) {
  termsChkBoxs[i].addEventListener("change", allUnChk);
};

function allUnChk() {
  //하위 체크박스중 하나라도 unchecked시에

  for (let i = 0; i < termsChkBoxs.length; i++) {
   if (!termsChkBoxs[i].checked) {
    allChkBox.checked = false;

   }
  // reqChk();

  }

};

// reqChk();
//
// function reqChk(){
//   if(!agree1.checked || !agree2.checked){
//     signupBtn.style.backgroundColor = "gray";
//     signupBtn.disabled = true;
//
//   }else if(agree1.checked && agree2.checked){
//     signupBtn.style.backgroundColor = `rgb(50, 52, 62)`;
//     signupBtn.disabled = false;
//   }
//   if(agree1.checked && agree2.checked && agree3.checked) {
//     allChkBox.checked = true;
//   }
// }