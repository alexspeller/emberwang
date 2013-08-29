getScript = (script, callback) ->
  el = document.createElement('script')
  el.src = "/libraries/#{script}"
  el.type = "text/javascript"
  document.body.appendChild(el)
  el.onload = callback

didReceiveMessage = (event) ->
  libraries = event.data.libraries

  libraries.forEach (lib) ->
    getScript lib.name, ->
      lib.loaded = true
      tryContinue()

  tryContinue = ->
    allLoaded = libraries.reduce (memo, lib) ->
      return false unless memo and lib.loaded
      true
    , true

    return unless allLoaded

    eval event.data.javascript

window.addEventListener "message", didReceiveMessage, false

document.addEventListener 'DOMContentLoaded', ->
  console.log 'posting message'
  window.parent.postMessage "Ready!", "*"
