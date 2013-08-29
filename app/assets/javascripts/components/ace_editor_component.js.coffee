EW.AceEditorComponent = Em.Component.extend
  contentDidChange: ->
    @set 'content', @editor.getValue()

  didInsertElement: ->
    @editor = ace.edit(@get('element'))
    @editor.getSession().setMode("ace/mode/javascript")
    @editor.on 'change', @contentDidChange.bind(@)

  willRemoveElement: ->
    @editor.destroy()


