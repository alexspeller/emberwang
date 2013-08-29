Emberwang.Wang = Em.Object.extend
  init: ->
    @_super()
    @set 'templates', Em.ArrayProxy.create content: @get('templates').map (t)->
      Em.Object.create t

  save: ->
    $.ajax(
      url: "/wangs/#{@get('token')}"
      data: JSON.stringify(@serialize())
      method: 'PUT'
      dataType: 'application/json'
    )

  serialize: ->
    javascript: @get('javascript')
    libraries: [
      name: 'jquery'
    ,
      name: 'handlebars'
    ,
      name: 'ember'
    ]
    templates: @get('templates').map (template) ->
      template.getProperties('name', 'body')
