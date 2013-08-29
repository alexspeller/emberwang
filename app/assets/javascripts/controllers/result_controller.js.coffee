EW.ResultController = Em.Controller.extend
  needs:      ['javascript', 'templates']
  javascript: Em.computed.alias('controllers.javascript.content')
  templates:  Em.computed.alias('controllers.templates')

  content: (->
    javascript: @get('javascript')
    libraries: [
      name: 'jquery'
    ,
      name: 'handlebars'
    ,
      name: 'ember'
    ]
    templates: @get('templates').map (template) -> template.getProperties('name', 'body')
  ).property 'javascript', 'templates.@each.name', 'templates.@each.body'

