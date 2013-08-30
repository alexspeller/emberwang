EW.TemplatesController = Em.Controller.extend
  needs:        ['wang']
  init: ->
    @_super()
    @set 'content', @get('controllers.wang.templates')
    @get('content').forEach (template) ->
      template.language ||= 'handlebars'

  actions:
    addTemplate: ->
      template = EW.Template.create()
      if @get('content.length') is 0
        template.set 'name', 'application'
        template.set 'body', 'Hello World!'
      @get('content').pushObject template


    removeTemplate: (template) ->
      @get('content').removeObject template

