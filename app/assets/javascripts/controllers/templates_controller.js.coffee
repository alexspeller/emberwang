EW.TemplatesController = Em.Controller.extend
  needs:        ['wang']
  language:     "handlebars"
  init: ->
    @_super()
    @set 'content', @get('controllers.wang.templates')

  actions:
    addTemplate: ->
      template = EW.Template.create()
      if @get('content.length') is 0
        template.set 'name', 'application'
        template.set 'body', 'Hello World!'
      @get('content').pushObject template


    removeTemplate: (template) ->
      @get('content').removeObject template

