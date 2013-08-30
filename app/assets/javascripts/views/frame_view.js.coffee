observeProps = EW.WangController.wangProperties.map (prop) ->
  "content.#{prop}"

EW.FrameView = Ember.View.extend
  tagName: "iframe"
  src: "/runner"
  attributeBindings: [ "src" ]

  contentDidChange: Ember.debouncedObserver observeProps..., 500, ->
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
      message = @get("content").serialize()
      message.javascript = @get('content').compile()
      @get('contentWindow').postMessage message, "*"
    if event.data.href
      @set 'hash', event.data.href

