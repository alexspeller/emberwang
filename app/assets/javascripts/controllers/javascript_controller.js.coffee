EW.JavascriptController = Em.Controller.extend
  needs:      ['wang']
  content: Em.computed.alias('controllers.wang.javascript')

  language: 'javascript'
