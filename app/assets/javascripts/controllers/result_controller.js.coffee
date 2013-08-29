EW.ResultController = Em.Controller.extend
  needs: ['javascript']
  javascriptBinding: 'controllers.javascript.content'

  content: (->
    javascript: @get('javascript')
  ).property 'javascript'

