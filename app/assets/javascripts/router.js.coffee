Emberwang.Router.map ->
  @resource 'wang', path: '/wang/:token'


EW.IndexRoute = Em.Route.extend
  beforeModel: ->
    console.log 'getting new wang'
    $.getJSON('/wangs/new').then (data) =>
      console.log 'got new wang', data.token
      @transitionTo 'wang', EW.Wang.create data

EW.WangRoute = Em.Route.extend
  model: (params) ->
    console.log "loading wang", params.token
    $.getJSON("/wangs/#{params.token}").then (data) =>
      console.log 'loaded wang', data.token
      @transitionTo 'wang', EW.Wang.create data


