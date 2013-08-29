didReceiveMessage = (event) ->
  eval event.data.javascript
#   destroyApps()
#   Ember.run ->
#     $("#css").html(data.css)
#     $("body").html(data.hbs)
#     eval(data.js)

# destroyApps = ->
#   Ember.run ->
#     $(window).off()
#     for name of window
#       try
#         obj = window[name]
#         if obj and obj.constructor is Ember.Application
#           obj.destroy()
#           delete window[name]
#       catch error
#         console.log error
    # Ember.TEMPLATES = {}

window.addEventListener "message", didReceiveMessage, false

document.addEventListener 'DOMContentLoaded', ->
  console.log 'posting message'
  window.parent.postMessage "Ready!", "*"
