EW.ResultController = Em.Controller.extend
  needs: ['javascript']
  javascriptBinding: 'controllers.javascript.content'

  content: (->
    javascript: @get('javascript')
    libraries: [
      name: 'jquery'
    ,
      name: 'handlebars'
    ,
      name: 'ember'
    ]
  ).property 'javascript'

