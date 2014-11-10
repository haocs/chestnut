module.exports = (app, controller) ->
  app.all '/heartbeat', controller.heartbeat

  app.get  '/session/:id', controller.getSession

  app.post '/session', controller.createSession
