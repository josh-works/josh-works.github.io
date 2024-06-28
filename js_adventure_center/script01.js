document.getElementById("startOver").addEventListener("click", startOver); 

var html = document.querySelector('html');
var stepLinks = document.getElementsByClassName('step')
var sections = document.querySelectorAll('section')

for (var i = 0; i < stepLinks.length; i++) {
  stepLinks[i].addEventListener("click", nextStep)
}

function nextStep() {
  var currentStep = this.dataset.step
  var nextStep = parseInt(currentStep) + 1
  sections[nextStep].classList.remove("hidden")
  html.classList.add("step" + nextStep.toString())
}

var firstSection = sections[0]

function startOver() {
  html.className = ''
  for (var i = 0; i < sections.length; i++) {
    sections[i].classList.add("hidden")
  }
  firstSection.classList.remove("hidden")
}
