observeProps = ['javascript', 'templates.@each.name', 'templates.@each.body']

EW.WangController = Em.ObjectController.extend
  serialize: -> @get('model').serialize()

  contentDidChange: Ember.debouncedObserver observeProps..., 500, ->
    @save()

  save: ->
    @get('model').save()






EW.WangController.reopenClass
  wangProperties: observeProps
