EW.AceEditorComponent = Em.Component.extend
  updateContent: ->
    @editor.setValue @get('content')

  didInsertElement: ->
    @editor = ace.edit(@get('element'))
    @editor.getSession().setMode("ace/mode/#{@get 'language'}")
    @editor.on 'change', =>
      @set 'content', @editor.getValue()
    @updateContent()

  willRemoveElement: ->
    @editor.destroy()


