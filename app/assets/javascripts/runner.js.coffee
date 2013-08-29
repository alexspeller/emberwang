getScript = (script, callback) ->
  el = document.createElement('script')
  el.src = "/libraries/#{script}"
  el.type = "text/javascript"
  document.body.appendChild(el)
  el.onload = callback

didReceiveMessage = (event) ->
  console.log "Message received", event.data
  libraries = event.data.libraries

  libraries.forEach (lib) ->
    getScript lib.name, ->
      console.log 'loaded', lib.name
      lib.loaded = true
      tryContinue()

  tryContinue = ->
    allLoaded = libraries.reduce (memo, lib) ->
      return false unless memo and lib.loaded
      true
    , true

    return unless allLoaded

    event.data.templates.forEach (template) ->
      Ember.TEMPLATES[template.name] = Ember.Handlebars.compile template.body

    eval event.data.javascript

window.addEventListener "message", didReceiveMessage, false

document.addEventListener 'DOMContentLoaded', ->
  window.parent.postMessage "Ready!", "*"

window.addEventListener 'hashchange', ->
  window.parent.postMessage {href: window.location.hash}, "*"
