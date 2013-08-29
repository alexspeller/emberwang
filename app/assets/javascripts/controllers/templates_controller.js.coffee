EW.TemplatesController = Em.ArrayController.extend
  addTemplate: ->
    template = EW.Template.create()
    if @get('length') is 0
      template.set 'name', 'application'
    @pushObject template


  removeTemplate: (template) ->
    @removeObject template

