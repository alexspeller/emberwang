Emberwang.Router.map ->
  @resource 'wang', path: '/wang/:token'


EW.ApplicationRoute = Em.Route.extend
  beforeModel: ->
    navigator.id.watch
      loggedInUser: null
      onlogin: (assertion) =>
        # A user has logged in! Here you need to:
        # 1. Send the assertion to your backend for verification and to create a session.
        # 2. Update your UI.
        $.ajax # <-- This example uses jQuery, but you can use whatever you'd like
          type: "POST"
          url: "/auth/login" # This is a URL on your website.
          data:
            assertion: assertion

          success: (res, status, xhr) =>
            @controllerFor("application").set 'user', res.email

          error: (xhr, status, err) ->
            navigator.id.logout()
            alert "Login failure: " + err


      onlogout: =>
        # A user has logged out! Here you need to:
        # Tear down the user's session by redirecting the user or making a call to your backend.
        # Also, make sure loggedInUser will get set to null on the next page load.
        # (That's a literal JavaScript null. Not false, 0, or undefined. null.)
        $.ajax
          type: "POST"
          url: "/auth/logout" # This is a URL on your website.
          success: (res, status, xhr) =>
            @controllerFor("application").set 'user', null

          error: (xhr, status, err) ->
            alert "Logout failure: " + err


  actions:
    personaLogin: ->
      navigator.id.request()
    personaLogout: ->
      navigator.id.logout()


EW.IndexRoute = Em.Route.extend
  beforeModel: ->
    EW.Wang.new().then (wang) =>
      @transitionTo 'wang', wang

EW.WangRoute = Em.Route.extend
  model: (params) ->
    EW.Wang.find params.token
