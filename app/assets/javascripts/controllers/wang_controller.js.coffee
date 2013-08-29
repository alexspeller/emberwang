observeProps = ['javascript', 'templates.@each.name', 'templates.@each.body']

EW.WangController = Em.ObjectController.extend
  serialize: -> @get('model').serialize()

  contentDidChange: (->
    Em.run.once @, 'save'
  ).observes observeProps...

  save: ->
    @get('model').save()






EW.WangController.reopenClass
  wangProperties: observeProps
