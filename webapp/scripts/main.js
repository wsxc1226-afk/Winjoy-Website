const NavigationBar = document.getElementById("navigation_bar");
const navBtns = document.querySelectorAll(".nav_btn");
const funcBtns = document.querySelectorAll(".func .nav_btn");
const arrows = document.querySelectorAll(".fa-angle-down");
const modals = document.querySelectorAll(".modal");
const logoWrapper = document.getElementById("logo_wrapper");
const logoImg = document.getElementById("logo_img");
const logo = document.getElementById("logo");

const mainBannerImgNum = 14;
const arrowDuration = 100;
const darkGrey = "#333333";
const white = "#ffffff";
const black = "#000000";

const transitionDuration = "0.5s";
const hidden = "hidden";
const rotate0 = "rotate(0)";
const rotate180 = "rotate(180deg)";
const click = "click";

let isOpen = false;





NavigationBar.style.transitionDuration = transitionDuration;
window.onscroll = handleScroll;
funcBtns.forEach(btn => btn.addEventListener(click, handleFuncBtnClick));

function logoColorChange(color) {
  logoWrapper.style.border = `2px solid ${color}`;
  logoImg.style.color = color;
  logo.style.color = color;
}

function handleScroll() {
  const pageOffset = window.pageYOffset;
  setNavigationBarStyle(pageOffset);
  if (isOpen) {
    closeAllModalsAndRotateAllArrows();
  }
}

function setNavigationBarStyle(pageOffset) {
  const isScrolled = pageOffset > 0;
  NavigationBar.style.height = isScrolled ? "9vh" : "12vh";
  NavigationBar.style.backgroundColor = isScrolled ? white : "transparent";
  logoColorChange(isScrolled ? darkGrey : white);
  navBtns.forEach(btn => setNavBtnStyle(btn, isScrolled));
}

function setNavBtnStyle(btn, isScrolled) {
  btn.style.color = isScrolled ? darkGrey : white;
  btn.onmouseover = () => { btn.style.color = isScrolled ? black : white; };
  btn.onmouseleave = () => { btn.style.color = isScrolled ? darkGrey : white; };
}

// About Modal

function openModalAndRotateArrow(modal, btn) {
  modal.classList.remove(hidden);
  isOpen = true;
  btn.childNodes[1].animate({ transform: [rotate180] }, { duration: arrowDuration, fill: "forwards" });
}

function closeModalsAndRotateArrows() {
  modals.forEach(modal => modal.classList.add(hidden));
  arrows.forEach(arrow => arrow.animate({ transform: [rotate0] }, { duration: arrowDuration, fill: "forwards" }));
  isOpen = false;
}

function handleFuncBtnClick(event) {
  event.preventDefault();
  const btn = event.target.closest('.nav_btn');
  const targetModal = btn.nextElementSibling;
  const isModalOpen = !targetModal.classList.contains(hidden);
  setModalAndArrowState(targetModal, btn, isModalOpen);
}

function setModalAndArrowState(modal, btn, isModalOpen) {
  if (isModalOpen) {
    closeModalAndRotateArrow(modal, btn);
  } else {
    closeAllModalsAndRotateAllArrows();
    openModalAndRotateArrow(modal, btn);
  }
}

function closeModalAndRotateArrow(modal, btn) {
  modal.classList.add(hidden);
  isOpen = false;
  btn.childNodes[1].animate({ transform: [rotate0] }, { duration: arrowDuration, fill: "forwards" });
}

function closeAllModalsAndRotateAllArrows() {
  modals.forEach((modal, idx) => {
    modal.classList.add(hidden);
    funcBtns[idx].childNodes[1].animate({ transform: [rotate0] }, { duration: arrowDuration, fill: "forwards" });
  });
}




// Random Background Image Generation
const mainBannerBGImg = document.getElementById("main_img");
mainBannerBGImg.src = `./assets/bannerimages/${Math.floor(Math.random() * mainBannerImgNum)}.jpg`;

var classElement = document.querySelector('.class'); // select .class

document.getElementById('hoverButton1').addEventListener('mouseover', function() {
  classElement.style.backgroundImage = "url('./assets/images/wallpapers/skiing.jpg')";
  classElement.style.backgroundSize = "100% auto"; // Set width to 100%, auto-adjust height
  classElement.style.transition = "0.4s ease-in-out"; // Set transition
});


document.getElementById('hoverButton1').addEventListener('mouseout', function() {
  classElement.style.backgroundImage = defaultBackgroundImage;
  classElement.style.transition = "0.4s ease-in-out"; // Set transition
});

document.getElementById('hoverButton2').addEventListener('mouseover', function() {
  classElement.style.backgroundImage = "url('./assets/images/wallpapers/boarding.jpg')";
  classElement.style.backgroundSize = "100% auto"; // Set width to 100%, auto-adjust height
  classElement.style.transition = "0.4s ease-in-out"; // Set transition
});

document.getElementById('hoverButton2').addEventListener('mouseout', function() {
  classElement.style.backgroundImage = defaultBackgroundImage;
  classElement.style.transition = "0.4s ease-in-out"; // Set transition
});


//About login, logout, signup, welcome user name
function checkLocalStorageValue(){
//check user already login with the way using localstorage
var myName = localStorage.getItem('myName');
var loginButton = document.getElementById('login');
var registerButton = document.getElementById('register');
if (myName !="" && myName !=null && myName !== null && myName !=undefined) {
            	    loginButton.innerText = "Welcome, " + myName+"!";
            	    registerButton.innerText = 'LOGOUT'; 
     
            	
    } else {
       loginButton.innerText="LOGIN";
       registerButton.innerText = 'SIGN UP';
    }
    	
}


document.getElementById('login').addEventListener('click', function() {
    var loginValue = this.innerText;
    switch (loginValue) {
        case 'LOGIN':
			window.location.href = 'signin.jsp';
            return;
	}
});

document.getElementById('register').addEventListener('click', function() {
    var registerValue = this.innerText;
    switch (registerValue) {
        case 'SIGN UP':
			window.location.href = 'signup.jsp';
            break;
        case 'LOGOUT':
			var loginButton = document.getElementById('login');
			loginButton.innerText="LOGIN";
       		registerValue.innerText = 'SIGN UP';
			localStorage.setItem('myName', "" );
			window.location.href = 'main.jsp';
            break;
	}
});













