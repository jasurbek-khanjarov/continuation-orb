"use strict"

function testDisplayText(input) {
  return input == getText();
}

function showText() {
  document.getElementById("pText").innerHTML = getText();
}

function getText() {
  return "Hello World"
}

module.exports = testDisplayText;
