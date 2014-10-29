module.exports = (app, controller) ->
  app.all '/heartbeat', controller.heartbeat

  app.all '/session/:id', controller.getSession
