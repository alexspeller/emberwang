EW.JavascriptController = Em.Controller.extend
  needs:      ['wang']
  content: Em.computed.alias('controllers.wang.javascript')

  language: Em.computed.alias('controllers.wang.script_language')
  languages:  'javascript coffee'.w()
