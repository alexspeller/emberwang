getScript = (script, callback) ->
  el = document.createElement('script')
  el.src = "/libraries/#{script}"
  el.type = "text/javascript"
  document.body.appendChild(el)
  el.onload = callback

didReceiveMessage = (event) ->
  console.log "Message received", event.data
  libraries = event.data.libraries

  loadLibs = ->
    library = libraries.shift()
    if library?
      getScript library.name, ->
        console.log 'loaded', library.name
        loadLibs()
    else
      event.data.templates.forEach (template) ->
        Ember.TEMPLATES[template.name] = Ember.Handlebars.compile template.body

      eval event.data.javascript

  loadLibs()

window.addEventListener "message", didReceiveMessage, false

document.addEventListener 'DOMContentLoaded', ->
  window.parent.postMessage "Ready!", "*"

window.addEventListener 'hashchange', ->
  window.parent.postMessage {href: window.location.hash}, "*"
