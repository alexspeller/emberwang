observeProps = EW.WangController.wangProperties.map (prop) ->
  "content.#{prop}"

EW.FrameView = Ember.View.extend
  tagName: "iframe"
  src: "/runner"
  attributeBindings: [ "src" ]

  contentDidChange: (->
    Em.run.once @, 'reloadContentWindow'
  ).observes observeProps...

  reloadContentWindow: ->
    @set 'isReady', false
    @get('contentWindow').location.reload()

  contentWindow: (->
    @get("element").contentWindow
  ).property 'element'

  willInsertElement: ->
    window.addEventListener "message", @didReceiveMessage.bind(@)

  didReceiveMessage: (event) ->
    if event.data is "Ready!"
      @set 'isReady', true
      @get('contentWindow').postMessage @get("content").serialize(), "*"
    if event.data.href
      @set 'hash', event.data.href

