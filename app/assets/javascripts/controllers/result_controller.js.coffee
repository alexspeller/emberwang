EW.ResultController = Em.Controller.extend
  needs:  ['wang']
  wang:   Em.computed.alias('controllers.wang')
