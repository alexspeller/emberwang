EW.JavascriptView = Em.View.extend
  contentDidChange: ->
    @set 'content', @editor.getValue()

  didInsertElement: ->
    @editor = ace.edit("editor");
    @editor.getSession().setMode("ace/mode/javascript");
    @editor.on 'change', @contentDidChange.bind(@)

  willRemoveElement: ->
    @editor.destroy()


