EW.AceEditorComponent = Em.Component.extend
  updateContent: ->
    @editor.setValue @get('content')

  didInsertElement: ->
    ace.config.set "workerPath", "/assets/src"
    @editor = ace.edit(@get('element'))
    @editor.setTheme('ace/theme/tomorrow_night_eighties');
    @setLanguage()
    @editor.on 'change', =>
      @set 'content', @editor.getValue()
    @updateContent()


  setLanguage: (->
    @editor.getSession().setMode("ace/mode/#{@get 'language'}")
  ).observes('language')

  willRemoveElement: ->
    @editor.destroy()


