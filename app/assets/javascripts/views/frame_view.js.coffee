EW.FrameView = Ember.View.extend
  tagName: "iframe"
  src: "/runner"
  attributeBindings: [ "src" ]

  contentDidChange: (->
    @set 'isReady', false
    @get('contentWindow').location.reload()
  ).observes("content")

  contentWindow: (->
    @get("element").contentWindow
  ).property 'element'

  willInsertElement: ->
    window.addEventListener "message", @didReceiveMessage.bind(@)

  didReceiveMessage: (event) ->
    if event.data is "Ready!"
      @set 'isReady', true
      @get('contentWindow').postMessage @get("content"), "*"

