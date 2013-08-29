Emberwang.Router.map ->
  @resource 'wang', path: '/wang/:token'


EW.IndexRoute = Em.Route.extend
  beforeModel: ->
    EW.Wang.new().then (wang) =>
      @transitionTo 'wang', wang

EW.WangRoute = Em.Route.extend
  model: (params) ->
    EW.Wang.find params.token


