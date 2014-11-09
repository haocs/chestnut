window.helloText = ->
  "Hello, World!"

window.hello = ->
  html = JST["app/templates/hello.us"](text: helloText())
  document.body.innerHTML += html
  return

if window.addEventListener
  window.addEventListener "DOMContentLoaded", hello, false
else
  window.attachEvent "onload", hello
