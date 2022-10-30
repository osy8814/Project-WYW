const allChkBox = document.querySelector(`#selectAll`);
const termsChkBoxs = document.querySelectorAll(".chkbox");

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
}

//천체 동의체크박스가 'Change'될 때 이벤트
allChkBox?.addEventListener("change", allchk);

//하위 동의체크박스 중 하나가 'Change'될 때 이벤트
for (let i = 0; i < termsChkBoxs.length; i++) {
  termsChkBoxs[i].addEventListener("change", allUnChk);
}

function allUnChk() {
  //하위 체크박스중 하나라도 unchecked시에
  for (let i = 0; i < termsChkBoxs.length; i++) {
    if (!termsChkBoxs[i].checked) {
      allChkBox.checked = false;
      //allChk박스 체크 해제
    }
  }
}
