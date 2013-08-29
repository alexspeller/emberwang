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

EW.Wang.reopenClass
  new: ->
    $.getJSON('/wangs/new').then (data) =>
      console.log 'got new wang', data.wang.token
      return EW.Wang.create data.wang

  find: (token) ->
    console.log "loading wang", token
    $.getJSON("/wangs/#{token}").then (data) =>
      console.log 'loaded wang', data.wang.token
      return EW.Wang.create data.wang

